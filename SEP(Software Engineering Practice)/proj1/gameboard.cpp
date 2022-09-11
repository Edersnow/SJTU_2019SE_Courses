#include "gameboard.h"
#include "Exceptions.h"
#include <string.h>
#include <random>
#include <time.h>
#include <cstdlib>



Game_Board::Coordinate::Coordinate(int ox, int oy){
    x = ox;
    y = oy;
}



bool Game_Board::Coordinate::operator < (const Coordinate &other) const{
    //return true when other.x > x or other.x == x and other.y > y
    if (x < other.x){
        return true;
    }
    if (x == other.x && y < other.y){
        return true;
    }
    return false;
}



bool Game_Board::Coordinate::operator == (const Coordinate &other) const{
    return x == other.x && y == other.y;
}



Game_Board::Coordinate Game_Board::random_point_generator(){
    //static is needed
    static std::default_random_engine eng(time(NULL));
    static std::uniform_int_distribution<int> dis(0, Board_Size - 1);
    Coordinate test(dis(eng), dis(eng));

    //get a random point
    auto it = Empty_Set.lower_bound(test);
    if (it == Empty_Set.end()){

        //no empty point judge
        if (Empty_Set.begin() == Empty_Set.end()){
            throw board_is_full();
        }

        it = Empty_Set.begin();
    }
    return *it;
}



//set this function to reduce repeating part of code
void Game_Board::read_data(void *des, unsigned long long siz, FILE *&target){
    if (fread(des, siz, 1, target) == 0){
        fclose(target);
        throw file_corruption();
    }
}



//set this function to reduce repeating part of code
void Game_Board::write_data(void *src, unsigned long long siz, FILE *&target){
    if (fwrite(src, siz, 1, target) == 0){
        fclose(target);
        throw fail_to_store_data();
    }
}



Game_Board::Coordinate Game_Board::get_next_coordinate(Snake &cur_snake){
    //test
    if (cur_snake.Position.empty()){
        throw fatal_error();
    }

    //get Coordinate in front of the snake
    Coordinate cur_pos = cur_snake.Position.front();
    switch (cur_snake.Direction) {
    case Up:
        if (cur_pos.y == 0){
            cur_pos.y = Board_Size - 1;
        }
        else{
            --cur_pos.y;
        }
        break;

    case Down:
        if (cur_pos.y == Board_Size - 1){
            cur_pos.y = 0;
        }
        else{
            ++cur_pos.y;
        }
        break;

    case Left:
        if (cur_pos.x == 0){
            cur_pos.x = Board_Size - 1;
        }
        else{
            --cur_pos.x;
        }
        break;

    case Right:
        if (cur_pos.x == Board_Size - 1){
            cur_pos.x = 0;
        }
        else{
            ++cur_pos.x;
        }
        break;
    }

    return cur_pos;
}



void Game_Board::move_snake_ahead(Snake &cur_snake, Coordinate ahead){
    Coordinate tmpBack = cur_snake.Position.back();

    //add a new point to the snake
    Board[ahead.x][ahead.y] = Barrier;
    cur_snake.Position.push_front(ahead);
    Empty_Set.erase(ahead);

    //delete the point at the end of the snake
    Board[tmpBack.x][tmpBack.y] = Empty;
    cur_snake.Position.pop_back();
    Empty_Set.insert(tmpBack);
}



void Game_Board::add_snake_length(Snake &cur_snake, Coordinate ahead){
    //just add a new point
    Board[ahead.x][ahead.y] = Barrier;
    cur_snake.Position.push_front(ahead);
    Empty_Set.erase(ahead);
}



void Game_Board::reborn_snake(Snake &cur_snake){
    //clear the snake, set to empty
    while (cur_snake.Position.size()){
        Coordinate tmp = cur_snake.Position.back();
        Board[tmp.x][tmp.y] = Empty;
        Empty_Set.insert(tmp);
        cur_snake.Position.pop_back();
    }

    //re-init the snake
    Coordinate init_snake = random_point_generator();
    Board[init_snake.x][init_snake.y] = Barrier;
    cur_snake.Position.push_front(init_snake);
    Empty_Set.erase(init_snake);

    cur_snake.Input_Direction = Up;
    cur_snake.Direction = Up;
    cur_snake.Action_Interval = Normal;
    cur_snake.Current_Interval = 0;
}



//this function is part of init work (only be called by func init())
void Game_Board::init_snake(Snake &cur_snake){
    //delete Position
    while (cur_snake.Position.size()){
        cur_snake.Position.pop_back();
    }

    //init snake
    Coordinate init_snake = random_point_generator();
    Board[init_snake.x][init_snake.y] = Barrier;
    cur_snake.Position.push_front(init_snake);
    Empty_Set.erase(init_snake);

    cur_snake.Input_Direction = Up;
    cur_snake.Direction = Up;
    cur_snake.Action_Interval = Normal;
    cur_snake.Current_Interval = 0;
}



void Game_Board::generate_food(){
    Coordinate cur_pos;

    try {
        cur_pos = random_point_generator();

        //if board is full, just do nothing
    }  catch (board_is_full) {
        return;
    }

    static std::default_random_engine eng(time(NULL));
    static std::uniform_int_distribution<int> dis(1, 100);

    // choose a food type
    int test = dis(eng);
    if (test > 95){
        //SpeedDown
        Board[cur_pos.x][cur_pos.y] = SpeedDown;
    }
    else if (test > 90){
        //SpeedUp
        Board[cur_pos.x][cur_pos.y] = SpeedUp;
    }
    else if (test > 85){
        //Heart
        Board[cur_pos.x][cur_pos.y] = Heart;
    }
    else if (test > 80 && Basic_Information.Snake_Number == 2){
        //Gitf
        Board[cur_pos.x][cur_pos.y] = SlowOpponent;
    }
    else{
        //Food
        Board[cur_pos.x][cur_pos.y] = Food;
    }

    Empty_Set.erase(cur_pos);
}



Game_Board::Game_Board(){
    //init the class
    strcpy(File_Name, "game_datas");

    //judge weather the game data file is existing
    FILE *test = fopen(File_Name, "rb");
    if (test == nullptr){
        Basic_Information.File_is_Existing = false;
    }
    else{
        Basic_Information.File_is_Existing = true;
        fclose(test);
    }

    Basic_Information.End_Flag = true;

    //init the board and snake Position
    Empty_Set.clear();
    memset(Board, Empty, sizeof(Block_Status) * Board_Size * Board_Size);
    for (int i=0; i<Board_Size; ++i){
        for (int j=0; j<Board_Size; ++j){
            Empty_Set.insert(Coordinate(i, j));
        }
    }
    for (int i=0; i<Max_Snake_Num; ++i){
        Snake_Set[i].Position.clear();
    }
}



void Game_Board::init(const Block_Status targ_board[][Board_Size], int targ_num, Game_Mode targ_mode){
    //copy board,
    memcpy(Board, targ_board, sizeof (Block_Status) * Board_Size * Board_Size);

    //set Empty_set
    Empty_Set.clear();
    for (int i=0; i<Board_Size; ++i){
        for (int j=0; j<Board_Size; ++j){
            if (Board[i][j] == Empty){
                Empty_Set.insert(Coordinate(i, j));
            }

            //the board from menu interface should not have Head1/Head2/Body1/Body2
            if (Board[i][j] >= Head1){
                throw information_unmatch();
            }
        }
    }

    //set snakes
    for (int i=0; i<targ_num; ++i){
        Basic_Information.HP[i] = 1;
        init_snake(Snake_Set[i]);
    }

    //set init information
    Basic_Information.Snake_Number = targ_num;
    Basic_Information.Cur_Mode = targ_mode;

    Basic_Information.End_Flag = false;

    //generate food
    for (int i=0; i<=Basic_Information.Snake_Number; ++i){
        generate_food();
    }
}



//ONLY be called **WHEN edit -> game**
void Game_Board::set_board(const Block_Status targ_board[][Board_Size]){
    memcpy(Board, targ_board, sizeof (Block_Status) * Board_Size * Board_Size);

    /**
     * due to the Head1/Head2... has the same effect as barrier
     * I record the Snake's head/body and barrier all as Barrier
     * in the Board of a Game_Board class should never appear Head1/Head2...
     * and Head1/Head2... are only use for representing
     */
    for (int i=0; i<Basic_Information.Snake_Number; ++i){
        for (auto it : Snake_Set[i].Position){
            Board[it.x][it.y] = Barrier;
        }
    }

    //reset Empty_Set
    Empty_Set.clear();
    for (int i=0; i<Board_Size; ++i){
        for (int j=0; j<Board_Size; ++j){
            if (Board[i][j] == Empty){
                Empty_Set.insert(Coordinate(i, j));
            }
            if (Board[i][j] >= Head1){
                throw information_unmatch();
            }
        }
    }
}



void Game_Board::set_snake_direction(Snake_Name targ_snake, Head_Direction targ_direction){
    //check input, if conflict, return directly
    switch (Snake_Set[targ_snake].Direction) {
    case Up:
        if (targ_direction == Down){
            return;
        }
        break;

    case Down:
        if (targ_direction == Up){
            return;
        }
        break;

    case Left:
        if (targ_direction == Right){
            return;
        }
        break;

    case Right:
        if (targ_direction == Left){
            return;
        }
        break;
    }

    //set Input_Direction
    Snake_Set[targ_snake].Input_Direction = targ_direction;
}



//ONLY be called when restart
void Game_Board::reset(){
    //equal to init and just set the board all empty
    Block_Status Empty_Board[Board_Size][Board_Size];
    memset(Empty_Board, Empty, sizeof (Block_Status) * Board_Size * Board_Size);
    init(Empty_Board, Basic_Information.Snake_Number, Basic_Information.Cur_Mode);
}



//An important function
void Game_Board::run_to_next_status(){
    //Should not be called when game-over
    if (Basic_Information.End_Flag == true){
        throw invalid_use_of_method();
    }

    //record the coordinate in front of each snake
    Coordinate snake_ahead[Max_Snake_Num];

    //record the action snakes should take
    Snake_Action snake_action[Max_Snake_Num];

    //record the number of new food needed
    int NewFoodNumber = 0;

    //init snake_action
    for (int i=0; i<Basic_Information.Snake_Number; ++i){
        snake_action[i] = None;
    }



    for (int i=0; i<Basic_Information.Snake_Number; ++i){
        //handle input direction
        //ONLY WHEN the snake should take action, the Direction member is set
        if (Snake_Set[i].Current_Interval >= Snake_Set[i].Action_Interval){
            Snake_Set[i].Direction = Snake_Set[i].Input_Direction;
        }

        //get next coordinate
        snake_ahead[i] = get_next_coordinate(Snake_Set[i]);
    }


    for (int i=0; i<Basic_Information.Snake_Number; ++i){
        //if Refresh time isn't enough, take no action
        if (Snake_Set[i].Current_Interval < Snake_Set[i].Action_Interval){
            ++ Snake_Set[i].Current_Interval;
            snake_action[i] = None;
        }
        //else set the current_interval zero and judge the snake's action
        else{
            Snake_Set[i].Current_Interval = 0;

            switch (Board[snake_ahead[i].x][snake_ahead[i].y]) {
            case Empty:
                snake_action[i] = Move;
                break;

            case Barrier:
                -- Basic_Information.HP[i];
                snake_action[i] = Reborn;
                if (Basic_Information.HP[i] == 0){
                    Basic_Information.End_Flag = true;
                }
                break;

            case Food:
                ++NewFoodNumber;
                snake_action[i] = Grow;
                break;

            case Heart:
                ++NewFoodNumber;
                ++Basic_Information.HP[i];
                snake_action[i] = Move;
                break;

            case SpeedUp:
                ++NewFoodNumber;
                if (Snake_Set[i].Action_Interval != veryFast){
                    -- Snake_Set[i].Action_Interval;
                }
                snake_action[i] = Move;
                break;

            case SpeedDown:
                ++NewFoodNumber;
                if (Snake_Set[i].Action_Interval != verySlow){
                    ++ Snake_Set[i].Action_Interval;
                }
                snake_action[i] = Move;
                break;

            case SlowOpponent:
                ++NewFoodNumber;

                //in order to add snake num, this part should be modified
                if (Snake_Set[i^1].Action_Interval != verySlow){
                    ++ Snake_Set[i^1].Action_Interval;
                }
                snake_action[i] = Move;
                break;

            default:
                throw fatal_error();
            }
        }
    }

    //in order to expland, this part should be modify
    if (snake_ahead[0] == snake_ahead[1] &&
        (snake_action[0] == Move || snake_action[0] == Grow) &&
        (snake_action[1] == Move || snake_action[1] == Grow)){

        //judge conflict
        move_snake_ahead(Snake_Set[0], snake_ahead[0]);
        --Basic_Information.HP[0];
        --Basic_Information.HP[1];

        //judge game-over
        if (Basic_Information.HP[0] == 0 || Basic_Information.HP[1] == 0){
            Basic_Information.End_Flag = true;
        }

        //correct food number
        if (Board[snake_ahead[0].x][snake_ahead[1].y] != Empty){
            -- NewFoodNumber;
        }
        snake_action[0] = Reborn;
        snake_action[1] = Reborn;
    }

    if (Basic_Information.End_Flag){
        return;
    }

    //NOTE: Reborn and new food could only be handled after the other
    //      snakes have moved
    for (int i=0; i<Basic_Information.Snake_Number; ++i){
        if (snake_action[i] == Move){
            move_snake_ahead(Snake_Set[i], snake_ahead[i]);
        }
        if (snake_action[i] == Grow){
            add_snake_length(Snake_Set[i], snake_ahead[i]);
        }
    }

    for (int i=0; i<Basic_Information.Snake_Number; ++i){
        if (snake_action[i] == Reborn){
            reborn_snake(Snake_Set[i]);
        }
    }

    //generate new food
    while (NewFoodNumber--){
        generate_food();
    }
}



void Game_Board::read_file(){
    try {



    if (!Basic_Information.File_is_Existing){
        return;
    }

    FILE *target = fopen(File_Name, "rb");
    if (target == nullptr){
        Basic_Information.File_is_Existing = false;
        throw information_unmatch();
    }

    /**
     * the storing format is given below (in front of function save_file())
     */
    fseek(target, 0, SEEK_SET);
    read_data(Board, sizeof (Block_Status) * Board_Size * Board_Size, target);
    read_data(&Basic_Information, sizeof (Basic_Information_Package), target);

    for (int i=0; i<Max_Snake_Num; ++i){
        Snake_Set[i].Position.clear();
    }

    for (int i=0; i<Basic_Information.Snake_Number; ++i){
        int length;
        Coordinate *arr;

        read_data(&Snake_Set[i].Input_Direction, sizeof (Head_Direction), target);
        read_data(&Snake_Set[i].Direction, sizeof (Head_Direction), target);
        read_data(&Snake_Set[i].Action_Interval, sizeof (int), target);
        read_data(&Snake_Set[i].Current_Interval, sizeof (int), target);
        read_data(&length, sizeof (int), target);
        arr = new Coordinate [length];
        read_data(arr, sizeof (Coordinate) * length, target);
        for (int j=0; j<length; ++j){
            Snake_Set[i].Position.push_back(arr[j]);
        }
    }
    fclose(target);

    //reset Empty_set
    Empty_Set.clear();
    for (int i=0; i<Board_Size; ++i){
        for (int j=0; j<Board_Size; ++j){
            if (Board[i][j] == Empty){
                Empty_Set.insert(Coordinate(i, j));
            }
        }
    }



    }
    catch (file_corruption){
        //if the file's format isn't correct
        //recreate a new file and kill current game
        FILE *newfile = fopen(File_Name, "wb");
        fclose(newfile);
        exit(EXIT_FAILURE);
    }
}



/**
 *
 * Storage format (Binary):
 *
 *  Board
 *  Basic_Information
 *  /for i in range (0, Snake_Number)/
 *      Snake_Set[i].Input_Direction
 *      Snake_Set[i].Direction
 *      Snake_Set[i].Speed
 *      Snake_Set[i].Interval
 *      Snake_Set[i].Position.size()
 *      Snake_Set[i].Position (Convert to array)
 *
 */
void Game_Board::save_file(){
    FILE *target = fopen(File_Name, "wb");
    if (target == nullptr){
        throw fail_to_create_file();
    }
    Basic_Information.File_is_Existing = true;

    write_data(Board, sizeof (Block_Status) * Board_Size * Board_Size, target);
    write_data(&Basic_Information, sizeof (Basic_Information_Package), target);

    for (int i=0; i<Basic_Information.Snake_Number; ++i){
        int length = Snake_Set[i].Position.size();
        Coordinate *arr = new Coordinate [length];
        for (int j=0; j<length; ++j){
            arr[j] = Snake_Set[i].Position[j];
        }

        write_data(&Snake_Set[i].Input_Direction, sizeof (Head_Direction), target);
        write_data(&Snake_Set[i].Direction, sizeof (Head_Direction), target);
        write_data(&Snake_Set[i].Action_Interval, sizeof (int), target);
        write_data(&Snake_Set[i].Current_Interval, sizeof (int), target);
        write_data(&length, sizeof (int), target);
        write_data(arr, sizeof (Coordinate) * length, target);
    }
    fclose(target);
}



void Game_Board::get_current_board(Block_Status display_board[][Board_Size]){
    //copy board
    memcpy(display_board, Board, sizeof (Block_Status) * Board_Size * Board_Size);

    //set Body1/Body2/...
    for (auto it : Snake_Set[0].Position){
        display_board[it.x][it.y] = Body1;
    }
    display_board[Snake_Set[0].Position.front().x][Snake_Set[0].Position.front().y] = Head1;

    if (Basic_Information.Snake_Number == 2){
        for (auto it : Snake_Set[1].Position){
            display_board[it.x][it.y] = Body2;
        }
        display_board[Snake_Set[1].Position.front().x][Snake_Set[1].Position.front().y] = Head2;
    }
}



void Game_Board::get_current_information(Basic_Information_Package &display_information){
    //just copy
    display_information = Basic_Information;
}



Game_Board::Head_Direction Game_Board::get_snake_direction(Snake_Name targ){
    return Snake_Set[targ].Direction;
}
