/*
 * proxy.c - ICS Web proxy
 *
 *
 */

#include "csapp.h"
#include <stdarg.h>
#include <sys/select.h>

typedef struct Msg {
    int connfd;
    struct sockaddr_in clientaddr;
} Msg_t;

/*
 * Function prototypes
 */
int parse_uri(char *uri, char *target_addr, char *path, char *port);
void format_log_entry(char *logstring, struct sockaddr_in *sockaddr, char *uri, size_t size);
ssize_t Rio_readn_w(int fd, void *usrbuf, size_t n);
ssize_t Rio_readlineb_w(rio_t *rp, void *usrbuf, size_t maxlen);
void Rio_writen_w(int fd, void *usrbuf, size_t n);
void *thread(void *vargp);

sem_t mutexForFile;

/*
 * main - Main routine for the proxy program
 */
int main(int argc, char **argv)
{
    int listenfd;
    socklen_t clientlen = sizeof(struct sockaddr_in);
    pthread_t tid;
    Msg_t *msg_to_pass;

    /* Check arguments */
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <port number>\n", argv[0]);
        exit(0);
    }

    // handle signal
    Signal(SIGPIPE, SIG_IGN);

    // init mutex
    Sem_init(&mutexForFile, 0, 1);

    // open listenfd (SHOULD BE CLOSE BY THREAD)
    listenfd = Open_listenfd(argv[1]);
    while (1) {
        // malloc for msg (SHOWLD BE FREE BY THREAD)
        msg_to_pass = Malloc(sizeof(Msg_t));

        msg_to_pass->connfd = Accept(listenfd, (SA *)&msg_to_pass->clientaddr, &clientlen);

        Pthread_create(&tid, NULL, thread, msg_to_pass);
    }

    exit(0);
}


/*
 * parse_uri - URI parser
 *
 * Given a URI from an HTTP proxy GET request (i.e., a URL), extract
 * the host name, path name, and port.  The memory for hostname and
 * pathname must already be allocated and should be at least MAXLINE
 * bytes. Return -1 if there are any problems.
 */
int parse_uri(char *uri, char *hostname, char *pathname, char *port)
{
    char *hostbegin;
    char *hostend;
    char *pathbegin;
    int len;

    if (strncasecmp(uri, "http://", 7) != 0) {
        hostname[0] = '\0';
        return -1;
    }

    /* Extract the host name */
    hostbegin = uri + 7;
    hostend = strpbrk(hostbegin, " :/\r\n\0");
    if (hostend == NULL)
        return -1;
    len = hostend - hostbegin;
    strncpy(hostname, hostbegin, len);
    hostname[len] = '\0';

    /* Extract the port number */
    if (*hostend == ':') {
        char *p = hostend + 1;
        while (isdigit(*p))
            *port++ = *p++;
        *port = '\0';
    } else {
        strcpy(port, "80");
    }

    /* Extract the path */
    pathbegin = strchr(hostbegin, '/');
    if (pathbegin == NULL) {
        pathname[0] = '\0';
    }
    else {
        pathbegin++;
        strcpy(pathname, pathbegin);
    }

    return 0;
}

/*
 * format_log_entry - Create a formatted log entry in logstring.
 *
 * The inputs are the socket address of the requesting client
 * (sockaddr), the URI from the request (uri), the number of bytes
 * from the server (size).
 */
void format_log_entry(char *logstring, struct sockaddr_in *sockaddr,
                      char *uri, size_t size)
{
    time_t now;
    char time_str[MAXLINE];
    unsigned host;
    unsigned a, b, c, d;

    /* Get a formatted time string */
    now = time(NULL);
    strftime(time_str, MAXLINE, "%a %d %b %Y %H:%M:%S %Z", localtime(&now));

    host = ntohl(sockaddr->sin_addr.s_addr);
    a = host >> 24;
    b = (host >> 16) & 0xff;
    c = (host >> 8) & 0xff;
    d = host & 0xff;

    /* Return the formatted log entry string */
    sprintf(logstring, "%s: %d.%d.%d.%d %s %zu", time_str, a, b, c, d, uri, size);
}

ssize_t Rio_readn_w(int fd, void *usrbuf, size_t n) {
    ssize_t res;
    res = rio_readn(fd, usrbuf, n);
    if (res < 0) {
        printf("Rio read fail.\n");
        return 0;
    }
    return res;
}

ssize_t Rio_readlineb_w(rio_t *rp, void *usrbuf, size_t maxlen) {
    ssize_t res;
    res = rio_readlineb(rp, usrbuf, maxlen);
    if (res < 0) {
        printf("Rio readline fail.\n");
        return 0;
    }
    return res;
}

void Rio_writen_w(int fd, void *usrbuf, size_t n) {
    if (rio_writen(fd, usrbuf, n) != n) {
        printf("Rio wtiten fail.\n");
    }
}

void *thread(void *vargp) {
    // detach
    Pthread_detach(pthread_self());

    // free vargp
    Msg_t msg = *((Msg_t *) vargp);
    Free(vargp);

    int clientfd;
    int len;
    size_t contentLength;
    int totalLen = 0;
    rio_t connRio, clientRio;
    char buf[MAXLINE], method[MAXLINE], uri[MAXLINE], version[MAXLINE];
    char hostname[MAXLINE], pathname[MAXLINE], port[MAXLINE];
    char requestheader[MAXLINE << 2];
    char log[MAXLINE];

    // init rio
    Rio_readinitb(&connRio, msg.connfd);
    if (!Rio_readlineb_w(&connRio, buf, MAXLINE)) {
        Close(msg.connfd);
        return NULL;
    }

    // get request header
    if (sscanf(buf, "%s %s %s", method, uri, version) != 3) {
        Close(msg.connfd);
        return NULL;
    }
    if (parse_uri(uri, hostname, pathname, port) < 0) {
        Close(msg.connfd);
        return NULL;
    }

    sprintf(requestheader, "%s /%s %s\r\n", method, pathname, version);
    while ((len = rio_readlineb(&connRio, buf, MAXLINE)) != 0) {
        // try get content length
        if (strncasecmp(buf, "Content-Length:", 15) == 0) {
            sscanf(buf + 16, "%zu", &contentLength);
        }
        strcat(requestheader, buf);
        if (strncmp(buf, "\r\n", 2) == 0) {
            break;
        }
    }
    // nothing... close connfd and return
    if (len == 0) {
        Close(msg.connfd);
        return NULL;
    }

    // get access to serve
    clientfd = Open_clientfd(hostname, port);

    // write request header
    Rio_readinitb(&clientRio, clientfd);
    Rio_writen_w(clientfd, requestheader, strlen(requestheader));

    if (strcasecmp(method, "GET")) {
        for (int i = 0; i < contentLength; ++i) {
            if (Rio_readnb(&connRio, buf, 1) == 0) {
                return NULL;
            }
            Rio_writen_w(clientfd, buf, 1);
        }
    }

    // handle msg from serve
    while ((len = Rio_readlineb_w(&clientRio, buf, MAXLINE)) != 0) {
        if (strncasecmp(buf, "Content-Length:", 15) == 0) {
            sscanf(buf + 16, "%zu", &contentLength);
        }
        totalLen += len;
        Rio_writen_w(msg.connfd, buf, len);
        if (strcmp(buf, "\r\n") == 0) {
            break;
        }
    }
    // nothing... close both and return
    if (len == 0) {
        Close(msg.connfd);
        Close(clientfd);
        return NULL;
    }

    for (int i = 0; i < contentLength; ++i) {
        // error
        if (Rio_readnb(&clientRio, buf, 1) == 0) {
            Close(msg.connfd);
            Close(clientfd);
            return NULL;
        }
        ++totalLen;
        Rio_writen_w(msg.connfd, buf, 1);
    }

    format_log_entry(log, &msg.clientaddr, uri, totalLen);

    P(&mutexForFile);
    printf("%s\n", log);
    V(&mutexForFile);

    // close both
    Close(clientfd);
    Close(msg.connfd);

    return NULL;
}
