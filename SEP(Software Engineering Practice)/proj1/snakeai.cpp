#include "snakeai.h"
#include <vector>
#include <queue>

SnakeAI::SnakeAI()
{

}

SnakeAI::Coordinate::Coordinate(int ox, int oy){
    x = ox;
    y = oy;
}

Game_Board::Head_Direction SnakeAI::getNextDirection(const Game_Board::Block_Status Board[][Game_Board::Board_Size], Game_Board::Head_Direction dir){
    //set default Choice Up
    Game_Board::Head_Direction Chosen = Game_Board::Up;

    //record position of foods
    std::vector<Coordinate> foodArray;

    //for bfs
    std::queue<Coordinate> que;

    //position of Head2
    Coordinate Head;

    //special case: no Body2 existing
    bool singleFlag = true;



    //init
    foodArray.clear();
    while (que.size()){
        que.pop();
    }

    for (int i=0; i<Game_Board::Board_Size; ++i){
        for (int j=0; j<Game_Board::Board_Size; ++j){
            //init
            isBarrier[i][j] = false;
            MapValue[i][j] = inf;


            //handle different cases
            //set isBarrier and PointValue
            switch (Board[i][j]) {
            case Game_Board::Body2:
                singleFlag = false;
                isBarrier[i][j] = true;
                break;

            case Game_Board::Barrier:
            case Game_Board::Body1:
            case Game_Board::Head1:
                isBarrier[i][j] = true;
                break;

            case Game_Board::Head2:
                Head = Coordinate(i, j);
                que.push(Head);
                //assign a positive number for head
                PointValue[i][j] = 10000;
                MapValue[i][j] = 0;
                break;

            case Game_Board::SpeedDown:
                foodArray.push_back(Coordinate(i, j));
                PointValue[i][j] = 50000;
                break;

            case Game_Board::Empty:
                PointValue[i][j] = 10000;
                break;

            case Game_Board::Food:
                foodArray.push_back(Coordinate(i, j));
                PointValue[i][j] = 1000;
                break;

            case Game_Board::SpeedUp:
                foodArray.push_back(Coordinate(i, j));
                PointValue[i][j] = 100;
                break;

            case Game_Board::SlowOpponent:
                foodArray.push_back(Coordinate(i, j));
                PointValue[i][j] = 100;
                break;

            case Game_Board::Heart:
                foodArray.push_back(Coordinate(i, j));
                PointValue[i][j] = 10;
                break;

            }
        }
    }


    //when the snake has no body, the head cannot just turn around
    if (singleFlag){
        Coordinate tmp = que.front();
        Coordinate next;
        que.pop();

        //Up
        next = Coordinate(tmp.x, (tmp.y - 1 + Game_Board::Board_Size) % Game_Board::Board_Size);
        if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] > MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y]){
            if (dir != Game_Board::Down){
                MapValue[next.x][next.y] = MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y];
                que.push(next);
            }
        }

        //Down
        next = Coordinate(tmp.x, (tmp.y + 1) % Game_Board::Board_Size);
        if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] > MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y]){
            if (dir != Game_Board::Up){
                MapValue[next.x][next.y] = MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y];
                que.push(next);
            }
        }

        //Left
        next = Coordinate((tmp.x - 1 + Game_Board::Board_Size) % Game_Board::Board_Size, tmp.y);
        if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] > MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y]){
            if (dir != Game_Board::Right){
                MapValue[next.x][next.y] = MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y];
                que.push(next);
            }
        }

        //Right
        next = Coordinate((tmp.x + 1) % Game_Board::Board_Size, tmp.y);
        if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] > MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y]){
            if (dir != Game_Board::Left){
                MapValue[next.x][next.y] = MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y];
                que.push(next);
            }
        }
    }


    //normal case
    //BFS part, update the value on MapValue.
    while (!que.empty()){
        Coordinate tmp = que.front();
        Coordinate next;
        que.pop();

        //Up
        next = Coordinate(tmp.x, (tmp.y - 1 + Game_Board::Board_Size) % Game_Board::Board_Size);
        if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] > MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y]){
            MapValue[next.x][next.y] = MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y];
            que.push(next);
        }

        //Down
        next = Coordinate(tmp.x, (tmp.y + 1) % Game_Board::Board_Size);
        if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] > MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y]){
            MapValue[next.x][next.y] = MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y];
            que.push(next);
        }

        //Left
        next = Coordinate((tmp.x - 1 + Game_Board::Board_Size) % Game_Board::Board_Size, tmp.y);
        if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] > MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y]){
            MapValue[next.x][next.y] = MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y];
            que.push(next);
        }

        //Right
        next = Coordinate((tmp.x + 1) % Game_Board::Board_Size, tmp.y);
        if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] > MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y]){
            MapValue[next.x][next.y] = MapValue[tmp.x][tmp.y] + PointValue[next.x][next.y];
            que.push(next);
        }
    }



    //find minimun Value among foodArray (and record it)
    long long minValue = inf;
    Coordinate target;
    for (auto it : foodArray){
        if (MapValue[it.x][it.y] < minValue){
            minValue = MapValue[it.x][it.y];
            target = it;
        }
    }


    //if no food is accessable
    if (minValue == inf){

        //Choose a direction which has no barrier ahead
        Coordinate next;

        //up
        next = Coordinate(Head.x, (Head.y - 1 + Game_Board::Board_Size) % Game_Board::Board_Size);
        if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] < minValue){

            //judge single Head2 case
            if (dir != Game_Board::Down){
                Chosen = Game_Board::Up;
                minValue = MapValue[next.x][next.y];
            }
        }

        //down
        next = Coordinate(Head.x, (Head.y + 1) % Game_Board::Board_Size);
        if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] < minValue){

            //judge single Head2 case
            if (dir != Game_Board::Up){
                Chosen = Game_Board::Down;
                minValue = MapValue[next.x][next.y];
            }
        }

        //left
        next = Coordinate((Head.x - 1 + Game_Board::Board_Size) % Game_Board::Board_Size, Head.y);
        if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] < minValue){

            //judge single Head2 case
            if (dir != Game_Board::Right){
                Chosen = Game_Board::Left;
                minValue = MapValue[next.x][next.y];
            }
        }

        //right
        next = Coordinate((Head.x + 1) % Game_Board::Board_Size, Head.y);
        if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] < minValue){

            //judge single Head2 case
            if (dir != Game_Board::Left){
                Chosen = Game_Board::Right;
                minValue = MapValue[next.x][next.y];
            }
        }
    }

    //else the path must exist
    else{

        //find path
        Coordinate last;
        Coordinate tmp = target;
        while (true){
            Coordinate next;

            last = tmp;
            minValue = inf;

            //up
            next = Coordinate(last.x, (last.y - 1 + Game_Board::Board_Size) % Game_Board::Board_Size);
            if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] < minValue){
                if (MapValue[next.x][next.y] == 0){
                    Chosen = Game_Board::Down;
                    break;
                }
                tmp = next;
                minValue = MapValue[next.x][next.y];
            }

            //down
            next = Coordinate(last.x, (last.y + 1) % Game_Board::Board_Size);
            if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] < minValue){
                if (MapValue[next.x][next.y] == 0){
                    Chosen = Game_Board::Up;
                    break;
                }
                tmp = next;
                minValue = MapValue[next.x][next.y];
            }

            //left
            next = Coordinate((last.x - 1 + Game_Board::Board_Size) % Game_Board::Board_Size, last.y);
            if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] < minValue){
                if (MapValue[next.x][next.y] == 0){
                    Chosen = Game_Board::Right;
                    break;
                }
                tmp = next;
                minValue = MapValue[next.x][next.y];
            }

            //right
            next = Coordinate((last.x + 1) % Game_Board::Board_Size, last.y);
            if (!isBarrier[next.x][next.y] && MapValue[next.x][next.y] < minValue){
                if (MapValue[next.x][next.y] == 0){
                    Chosen = Game_Board::Left;
                    break;
                }
                tmp = next;
                minValue = MapValue[next.x][next.y];
            }
        }
    }


    return Chosen;

}
