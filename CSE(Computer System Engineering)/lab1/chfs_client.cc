// chfs client.  implements FS operations using extent and lock server
#include "chfs_client.h"
#include "extent_client.h"
#include <sstream>
#include <iostream>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

chfs_client::chfs_client()
{
    ec = new extent_client();

}

chfs_client::chfs_client(std::string extent_dst, std::string lock_dst)
{
    ec = new extent_client();
    if (ec->put(1, "") != extent_protocol::OK)
        printf("error init root dir\n"); // XYB: init root dir
}

chfs_client::inum
chfs_client::n2i(std::string n)
{
    std::istringstream ist(n);
    unsigned long long finum;
    ist >> finum;
    return finum;
}

std::string
chfs_client::filename(inum inum)
{
    std::ostringstream ost;
    ost << inum;
    return ost.str();
}

bool
chfs_client::isfile(inum inum)
{
    extent_protocol::attr a;

    if (ec->getattr(inum, a) != extent_protocol::OK) {
        printf("error getting attr\n");
        return false;
    }

    if (a.type == extent_protocol::T_FILE) {
        printf("isfile: %lld is a file\n", inum);
        return true;
    } 
    printf("isfile: %lld is not a file\n", inum);
    return false;
}
/** Your code here for Lab...
 * You may need to add routines such as
 * readlink, issymlink here to implement symbolic link.
 * 
 * */

bool
chfs_client::isdir(inum inum)
{
    // Oops! is this still correct when you implement symlink?
    // return ! isfile(inum);
    extent_protocol::attr a;

    if (ec->getattr(inum, a) != extent_protocol::OK) {
        printf("error getting attr\n");
        return false;
    }

    if (a.type == extent_protocol::T_DIR) {
        printf("isdir: %lld is a dir\n", inum);
        return true;
    } 
    printf("isdir: %lld is not a dir\n", inum);
    return false;
}

int
chfs_client::getfile(inum inum, fileinfo &fin)
{
    int r = OK;

    printf("getfile %016llx\n", inum);
    extent_protocol::attr a;
    if (ec->getattr(inum, a) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    fin.atime = a.atime;
    fin.mtime = a.mtime;
    fin.ctime = a.ctime;
    fin.size = a.size;
    printf("getfile %016llx -> sz %llu\n", inum, fin.size);

release:
    return r;
}

int
chfs_client::getdir(inum inum, dirinfo &din)
{
    int r = OK;

    printf("getdir %016llx\n", inum);
    extent_protocol::attr a;
    if (ec->getattr(inum, a) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }
    din.atime = a.atime;
    din.mtime = a.mtime;
    din.ctime = a.ctime;

release:
    return r;
}


#define EXT_RPC(xx) do { \
    if ((xx) != extent_protocol::OK) { \
        printf("EXT_RPC Error: %s:%d \n", __FILE__, __LINE__); \
        r = IOERR; \
        goto release; \
    } \
} while (0)

// Only support set size of attr
int
chfs_client::setattr(inum ino, size_t size)
{
    int r = OK;

    /*
     * your code goes here.
     * note: get the content of inode ino, and modify its content
     * according to the size (<, =, or >) content length.
     */

    std::string buf;
    if (ec->get(ino, buf) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }
    buf.resize(size);

    if (ec->put(ino, buf) != extent_protocol::OK) {
        r = IOERR;
    }

release:
    return r;
}

int
chfs_client::create(inum parent, const char *name, mode_t mode, inum &ino_out)
{
    int r = OK;

    /*
     * your code goes here.
     * note: lookup is what you need to check if file exist;
     * after create file or dir, you must remember to modify the parent infomation.
     */
    bool res;
    std::string buf;
    size_t len = strlen(name);
    
    if (lookup(parent, name, res, ino_out) != extent_protocol::OK || res) {
        r = EXIST;
        goto release;
    }

    if (ec->create(extent_protocol::T_FILE, ino_out) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    if (ec->get(parent, buf) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }
    
    buf.append((char *)&ino_out, sizeof(inum));
    buf.append((char *)&len, sizeof(size_t));
    buf.append(name, len);

    if (ec->put(parent, buf) != extent_protocol::OK) {
        r = IOERR;
    }

release:
    return r;
}

int
chfs_client::mkdir(inum parent, const char *name, mode_t mode, inum &ino_out)
{
    int r = OK;

    /*
     * your code goes here.
     * note: lookup is what you need to check if directory exist;
     * after create file or dir, you must remember to modify the parent infomation.
     */
    bool res;
    std::string buf;
    size_t len = strlen(name);

    if (lookup(parent, name, res, ino_out) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    if (res) {
        r = EXIST;
        goto release;
    }

    if (ec->create(extent_protocol::T_DIR, ino_out) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    if (ec->get(parent, buf) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    buf.append((char *)&ino_out, sizeof(inum));
    buf.append((char *)&len, sizeof(size_t));
    buf.append(name, len);

    if (ec->put(parent, buf) != extent_protocol::OK) {
        r = IOERR;
    }

release:
    return r;
}

int
chfs_client::lookup(inum parent, const char *name, bool &found, inum &ino_out)
{
    int r = OK;

    /*
     * your code goes here.
     * note: lookup file from parent dir according to name;
     * you should design the format of directory content.
     */
    extent_protocol::attr a;
    std::list<dirent> dirents;
    std::string str_name = std::string(name);

    if (ec->getattr(parent, a) != extent_protocol::OK || a.type != extent_protocol::T_DIR) {
        r = IOERR;
        goto release;
    }

    readdir(parent, dirents);
    for (auto it: dirents) {
        if (it.name == str_name) {
            found = true;
            ino_out = it.inum;
            return r;
        }
    }

    found = false;

release:
    return r;
}

int
chfs_client::readdir(inum dir, std::list<dirent> &list)
{
    int r = OK;

    /*
     * your code goes here.
     * note: you should parse the dirctory content using your defined format,
     * and push the dirents to the list.
     */
    extent_protocol::attr a;
    const char *raw_data;
    std::string buf;
    unsigned int i = 0;

    if (ec->getattr(dir, a) != extent_protocol::OK || a.type != extent_protocol::T_DIR) {
        r = IOERR;
        goto release;
    }

    if (ec->get(dir, buf) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    raw_data = buf.c_str();
    list.clear();
    while (i < a.size) {
        inum ino;
        size_t len;
        dirent d;
        char *name_buf;

        memcpy(&ino, raw_data + i, sizeof(inum));
        i += sizeof(inum);
        memcpy(&len, raw_data + i, sizeof(size_t));
        i += sizeof(size_t);

        name_buf = (char *)malloc(len);
        memcpy(name_buf, raw_data + i, len);
        i += len;

        d.inum = ino;
        d.name = std::string(name_buf, len);
        list.push_back(d);
        free(name_buf);
    }

release:
    return r;
}

int
chfs_client::read(inum ino, size_t size, off_t off, std::string &data)
{
    int r = OK;

    /*
     * your code goes here.
     * note: read using ec->get().
     */
    std::string buf;

    if (ec->get(ino, buf) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    data.assign(buf, off, size);

release:
    return r;
}

int
chfs_client::write(inum ino, size_t size, off_t off, const char *data,
        size_t &bytes_written)
{
    int r = OK;

    /*
     * your code goes here.
     * note: write using ec->put().
     * when off > length of original file, fill the holes with '\0'.
     */
    std::string buf;
    std::string tmp;
    tmp.assign(data, size);

    if (ec->get(ino, buf) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    if (off + size > buf.size()) {
        buf.resize(off + size);
    }

    for (size_t i = off; i < off + size; i++) {
        buf[i] = data[i - off];
    }

    bytes_written = size;

    if (ec->put(ino, buf) != extent_protocol::OK) {
        r = IOERR;
    }

release:
    return r;
}

int chfs_client::unlink(inum parent, const char *name)
{
    int r = OK;

    /*
     * your code goes here.
     * note: you should remove the file using ec->remove,
     * and update the parent directory content.
     */
    bool res;
    inum id;
    std::list<dirent> dirents;
    std::string buf;

    if (lookup(parent, name, res, id) != extent_protocol::OK || !res) {
        r = NOENT;
        goto release;
    }

    if (ec->remove(id) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    if (readdir(parent, dirents) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    for (auto it : dirents) {
        if (it.inum != id) {
            size_t len = it.name.size();
            const char *name = it.name.c_str();
            buf.append((char *)&it.inum, sizeof(inum));
            buf.append((char *)&len, sizeof(size_t));
            buf.append(name, len);
        }
    }

    if (ec->put(parent, buf) != extent_protocol::OK) {
        r = IOERR;
    }

release:
    return r;
}

bool
chfs_client::issymlink(inum inum) {
    extent_protocol::attr a;

    if (ec->getattr(inum, a) != extent_protocol::OK) {
        printf("error getting attr\n");
        return false;
    }

    if (a.type == extent_protocol::T_SYMLINK) {
        return true;
    } 
    return false;
}

int
chfs_client::readlink(inum ino, std::string &buf) {
    int r = OK;

    if (ec->get(ino, buf) != extent_protocol::OK) {
        r = IOERR;
    }

    return r;
}

int 
chfs_client::symlink(inum parent, const char *name, const char *link, inum &ino_out) {
    int r = OK;

    std::string buf;
    inum id;
    bool res;
    size_t len;

    if (ec->get(parent, buf) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    if (lookup(parent, name, res, id) != extent_protocol::OK && res) {
        r = EXIST;
        goto release;
    }

    if (ec->create(extent_protocol::T_SYMLINK, ino_out) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    if (ec->put(ino_out, std::string(link)) != extent_protocol::OK) {
        r = IOERR;
        goto release;
    }

    len = strlen(name);
    buf.append((char *)&ino_out, sizeof(inum));
    buf.append((char *)&len, sizeof(size_t));
    buf.append(name, len);

    if (ec->put(parent, buf) != extent_protocol::OK) {
        r = IOERR;
    }    

release:
    return r;
}

