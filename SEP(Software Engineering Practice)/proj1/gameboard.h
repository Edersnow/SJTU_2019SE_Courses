#ifndef GAMEBOARD_H
#define GAMEBOARD_H
#include <deque>
#include <stdio.h>
#include <set>

/**
 * Class: Game_Board
 * ------------
 * The class is mainly used to store datas and process
 * operations on those datas.
 */
class Game_Board{
public:
    /**
     * Definition of some enumeration and constant
     * -------------------------------------------
     * Block_Status: the status of current block (coordinate),
     *               when handling datas, the snakes' body and wall are
     *               presented as Barrier, and when displaying, snakes'
     *               body will be presented as Head1, Body1, and so on.
     *
     * Head_Direction: the direction of snakes' movement
     *
     * Board_Size: Definition of the size of the board
     *
     * Max_Snake_Num: max number of snakes (define this constant in order
     *                to support extension)
     *
     */
    enum Block_Status {Empty, Barrier, Food, Heart, SpeedUp, SpeedDown, SlowOpponent, Head1, Body1, Head2, Body2};
    enum Game_Mode {Single, Human, AI};
    enum Head_Direction {Up, Down, Left, Right};
    enum Snake_Name {Snake0, Snake1};
    static const int Board_Size = 15;
    static const int Max_Snake_Num = 2;


    /**
     * Struct: Basic_Information_Package
     * ---------------------------------
     * A wrapper structure used to store the datas which would
     * be presented on GUI (except the board)
     *
     * Datas included:
     *  Snake_Number: number of snakes
     *  HP: recording health point, HP == 0 -> game over
     *  Cur_Mode: current game mode
     *  File_is_Existing: whether the game file is already existing
     *  End_Flag: whether the game is over
     */
    struct Basic_Information_Package{
        int Snake_Number;
        int HP[Max_Snake_Num];
        Game_Mode Cur_Mode;
        bool File_is_Existing;
        bool End_Flag;
    };


private:
    /**
     * Definition of some enumeration and constant
     * -------------------------------------------
     * Interval: enumeration of snakes' action interval, make
     *           codes more readable
     *
     * Snake_Action: definition of snake's action
     *
     * File_Name: name of the datas file
     *
     */
    enum Interval {veryFast = 3, Fast, Normal, Slow, verySlow};
    enum Snake_Action {None, Move, Grow, Reborn};
    char File_Name[12];


    /**
     * Storing the coordinate of points
     */
    struct Coordinate{
        int x;
        int y;

        Coordinate() = default;
        Coordinate(int ox, int oy);
        bool operator < (const Coordinate &other) const;
        bool operator == (const Coordinate &other) const;
    };


    /**
     * A set of private information for each snake
     */
    struct Snake{
        Head_Direction Input_Direction;
        Head_Direction Direction;
        std::deque<Coordinate> Position;
        int Action_Interval;
        int Current_Interval;
    };



    /**
     * Data Part
     */
    Block_Status Board[Board_Size][Board_Size];
    //a set for empty points
    std::set<Coordinate> Empty_Set;
    Basic_Information_Package Basic_Information;
    //to store snake's status
    Snake Snake_Set[Max_Snake_Num];



    /**
     * Private Methods Part
     */
    //generate point randomly
    Coordinate random_point_generator();

    //File IO part
    void read_data(void *, unsigned long long, FILE *&);
    void write_data(void *, unsigned long long, FILE *&);

    //get the point ahead of this snake
    Coordinate get_next_coordinate(Snake &);

    //corresponding to enum Snake_Action
    void move_snake_ahead(Snake &, Coordinate);
    void add_snake_length(Snake &, Coordinate);
    void reborn_snake(Snake &);

    //initialize snake when game start
    void init_snake(Snake &);
    void generate_food();



public:
    Game_Board();

    /**
     * Public Methods Part
     * Explanations are given in Design Document
     */
    void init(const Block_Status [][Board_Size], int, Game_Mode);
    void set_board(const Block_Status [][Board_Size]);
    void set_snake_direction(Snake_Name, Head_Direction);
    void reset();

    void run_to_next_status();

    void read_file();
    void save_file();

    void get_current_board(Block_Status [][Board_Size]);
    void get_current_information(Basic_Information_Package &);
    Head_Direction get_snake_direction(Snake_Name);
};

#endif // GAMEBOARD_H
