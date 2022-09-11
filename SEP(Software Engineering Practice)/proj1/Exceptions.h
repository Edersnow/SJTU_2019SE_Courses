#ifndef EXCEPTIONS_H
#define EXCEPTIONS_H

//the information between Core and Board(on MainWindow) is unmatch
class information_unmatch{};

//the game data file's format isn't match
class file_corruption{};

//cannot create file
class fail_to_create_file{};

//cannot store file
class fail_to_store_data{};

//the case that the game cannot continue
class fatal_error{};

//use method invalidly
class invalid_use_of_method{};

//the game board is full
class board_is_full{};

#endif // EXCEPTIONS_H
