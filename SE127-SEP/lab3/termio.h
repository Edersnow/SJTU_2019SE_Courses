#pragma once
/* some code from Libconio 1.0 (C) 2004 FSL A.C. */

#ifdef _WIN32
#include <conio.h>
#include <stdio.h>
#include <string.h>
#include <windows.h>
static void clrscr()
{
    system("cls");
}
#else
#include <termios.h>
#include <stdio.h>
#define ESC 033 /* Escape char */

static int getch()
{
    struct termios t;
    int c;

    tcgetattr(0, &t);
    t.c_lflag &= ~ECHO + ~ICANON;
    tcsetattr(0, TCSANOW, &t);
    fflush(stdout);
    c = getchar();
    t.c_lflag |= ICANON + ECHO;
    tcsetattr(0, TCSANOW, &t);
    return c;
}

static void clrscr()
{
    printf("%c[2J", ESC);
    printf("%c[%d;%dH", ESC, 0, 0);
}
#endif

#include <iostream>
#include <cstring>
using namespace std;

class Termio
{
public:
    // donot change the width and height
    static const int CANVAS_WIDTH = 41;
    static const int CANVAS_HEIGHT = 11;
    static char buffer[CANVAS_HEIGHT][CANVAS_WIDTH + 1];

    static char GetChar() {
        return getch();
    }

    static void Clear() {
        clrscr();
    }

    static void Draw() {
        for (int i = 0; i < CANVAS_HEIGHT; i++)
        {
            buffer[i][CANVAS_WIDTH] = '\0';
            cout << buffer[i] << endl;
        }
    }

    static void ResetBuffer() {
        for (int i = 0; i < CANVAS_HEIGHT; i++)
            memset(buffer[i], ' ', CANVAS_WIDTH);
        for (int i = 0; i < CANVAS_WIDTH; ++i){
            buffer[10][i] = '-';
        }
        for (int i = 0; i < CANVAS_HEIGHT; ++i){
            buffer[i][5] = '|';
            buffer[i][20] = '|';
            buffer[i][35] = '|';
        }
    }

    //rod : 0-2
    //pos : 0-4
    static void deleteDisk(int rod, int pos) {
        for (int i = 15*rod; i <= 10 + 15*rod; ++i){
            buffer[9 - pos*2][i] = ' ';
        }
        buffer[9 - pos*2][5 + 15*rod] = '|';
    }

    //size : 1-5
    static void addDisk(int rod, int pos, int size){
        for (int i = 5 + 15*rod - size; i <= 5 + 15*rod + size; ++i){
            buffer[9 - pos*2][i] = '*';
        }
    }
};
