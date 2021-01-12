#ifndef SNAKEAI_H
#define SNAKEAI_H
#include "gameboard.h"

class SnakeAI
{
private:
    const long long inf = 10000000000000000;
    struct Coordinate{
        int x;
        int y;

        Coordinate() = default;
        Coordinate(int ox, int oy);
    };

    //judge weather the point is barrier or not
    bool isBarrier[Game_Board::Board_Size][Game_Board::Board_Size];

    //record the "cost" when accessing this point from a neighbour point
    long long PointValue[Game_Board::Board_Size][Game_Board::Board_Size];

    //record the "total cost" from start point to this point
    long long MapValue[Game_Board::Board_Size][Game_Board::Board_Size];

public:
    SnakeAI();
    Game_Board::Head_Direction getNextDirection(const Game_Board::Block_Status Board[][Game_Board::Board_Size], Game_Board::Head_Direction);
};

#endif // SNAKEAI_H
