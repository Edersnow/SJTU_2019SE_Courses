// 519021910380 Lin Qilong
#include <getopt.h>
#include <stdlib.h>
#include <stdio.h>
#include "cachelab.h"

// define some structure
typedef struct line{
    int vaild;
    int tag;
    int timeStamp;
} line_t;

typedef struct group{
    line_t *lines;
} group_t;

group_t *caches;



int main(int argc, char **argv)
{
    const int m = 64;

    int s = 0;
    int E = 0;
    int b = 0;
    FILE *f;

    // handle the command input
    if (getopt(argc, argv, "s:E:b:t:") != 's'){
        return 0;
    }
    s = atoi(optarg);

    if (getopt(argc, argv, "s:E:b:t:") != 'E'){
        return 0;
    }
    E = atoi(optarg);

    if (getopt(argc, argv, "s:E:b:t:") != 'b'){
        return 0;
    }
    b = atoi(optarg);

    if (getopt(argc, argv, "s:E:b:t:") != 't'){
        return 0;
    }
    f = fopen(optarg, "r");
    if (f == NULL)  return 0;

    int S = 1 << s;


    // malloc caches
    caches = (group_t *)malloc(S * sizeof(group_t));
    for (int i = 0; i < S; ++i){
        caches[i].lines = (line_t *)malloc(E * sizeof(line_t));
        for (int j = 0; j < E; ++j){
            caches[i].lines[j].vaild = 0;
            caches[i].lines[j].timeStamp = 0;
        }
    }


    int t = m - b - s;

    int time = 0;
    int hits = 0;
    int misses = 0;
    int evictions = 0;


    char op;
    long addr;
    int len;
    int cycleTime;

    // read from files
    while (!feof(f)){
        if (fscanf(f, " %c %lx,%d", &op, &addr, &len) != 3){
            continue;
        }

        if (op == 'L' || op == 'S'){
            cycleTime = 1;
        }
        else if (op == 'M'){
            cycleTime = 2;
        }
        else {
            continue;
        }

        while(cycleTime--){
            ++time;

            // get groupNum and tag
            int groupNum = (addr >> b) & ((1 << s) - 1);
            int tag = (addr >> (b + s)) & ((1 << t) - 1);

            int isHit = 0;
            int invalidLine = -1;
            int minLine = -1;
            int minTime = 1 << 30;

            // search in the group
            for (int i = 0; i < E; ++i) {
                line_t *p = &caches[groupNum].lines[i];
                if (p->vaild && p->tag == tag){
                    isHit = 1;
                    p->timeStamp = time;
                    break;
                }
                if (!p->vaild && invalidLine == -1){
                    invalidLine = i;
                    break;
                }
                if (p->vaild && p->timeStamp < minTime){
                    minTime = p->timeStamp;
                    minLine = i;
                }
            }

            // case hit
            if (isHit){
                ++hits;
            }
            else{
                //case missing
                ++misses;
                if (invalidLine != -1){
                    line_t *p = &caches[groupNum].lines[invalidLine];
                    p->vaild = 1;
                    p->tag = tag;
                    p->timeStamp = time;
                }
                else {
                    //case eviction
                    ++evictions;
                    line_t *p = &caches[groupNum].lines[minLine];
                    p->tag = tag;
                    p->timeStamp = time;
                }
            }

        }
    }

    fclose(f);

    for (int i = 0; i < S; ++i){
        free(caches[i].lines);
    }
    free(caches);

    printSummary(hits, misses, evictions);
    return 0;
}
