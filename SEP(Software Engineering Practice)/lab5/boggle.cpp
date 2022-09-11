#include <iostream>
#include <algorithm>
#include <vector>
#include "lexicon.h"

using namespace std;

Lexicon dic("EnglishWords.txt");
vector<string> player_word_rec;
Lexicon player_word_set;
Lexicon computer_word_set;
int player_score = 0;
int computer_score = 0;

char **board;
int N;

int dx[] = {1, -1, 0, 0, 1, 1, -1, -1};
int dy[] = {0, 0, 1, -1, 1, -1, 1, -1};



bool isExisting_recur(const string &other, bool **isVisited, unsigned long long pos, int row, int col){
    if (pos == other.length())
        return true;

    for (int i=0; i<8; ++i){
        int next_x = row + dx[i];
        int next_y = col + dy[i];
        if (next_x < N && next_x >= 0 && next_y < N && next_y >= 0){
            if (!isVisited[next_x][next_y] && other[pos] == board[next_x][next_y]){
                isVisited[next_x][next_y] = true;
                if (isExisting_recur(other, isVisited, pos+1, next_x, next_y)){
                    return true;
                }
                isVisited[next_x][next_y] = false;
            }
        }
    }
    return false;
}
bool isExisting(const string &other){
    if (other.length() > 16){
        return false;
    }

    bool **visit_flag;
    visit_flag = new bool* [N];
    for (int k=0; k<N; ++k)
        visit_flag[k] = new bool [N];
    for (int i=0; i<N; ++i)
        for (int j=0; j<N; ++j)
            visit_flag[i][j] = false;

    for (int i=0; i<N; ++i){
        for (int j=0; j<N; ++j){
            if (other[0] == board[i][j]){
                visit_flag[i][j] = true;
                if (isExisting_recur(other, visit_flag, 1, i, j)){
                    return true;
                }
                visit_flag[i][j] = false;
            }
        }
    }
    return false;
}

string StringToUpper(string other){
    for (auto &it:other){
        if(it <= 'z' && it >= 'a')
            it += 'A' - 'a';
    }
    return other;
}
string StringToLower(string other){
    for (auto &it:other){
        if(it <= 'Z' && it >= 'A')
            it += 'a' - 'A';
    }
    return other;
}

void find_left_recur(string &cur, bool **isVisited, int row, int col){
    if (!dic.containsPrefix(cur)){
        return;
    }
    if (cur.length() >= 4){
        if(dic.contains(cur)){
            if (!computer_word_set.contains(cur) && !player_word_set.contains(StringToLower(cur))){
                computer_word_set.add(cur);
                computer_score += cur.length() - 3;
            }
        }
    }

    for (int i=0; i<8; ++i){
        int next_x = row + dx[i];
        int next_y = col + dy[i];
        if (next_x < N && next_x >=0 && next_y < N && next_y >=0){
            if (!isVisited[next_x][next_y]){
                isVisited[next_x][next_y] = true;
                cur.push_back(board[next_x][next_y]);

                find_left_recur(cur, isVisited, next_x, next_y);

                isVisited[next_x][next_y] = false;
                cur.pop_back();
            }
        }
    }
}

void find_left(){
    bool **visit_flag;
    string cur = "";
    visit_flag = new bool* [N];
    for (int k=0; k<N; ++k)
        visit_flag[k] = new bool [N];
    for (int i=0; i<N; ++i)
        for (int j=0; j<N; ++j)
            visit_flag[i][j] = false;

    for (int i=0; i<N; ++i){
        for (int j=0; j<N; ++j){
            visit_flag[i][j] = true;
            cur.push_back(board[i][j]);

            find_left_recur(cur, visit_flag, i, j);

            visit_flag[i][j] = false;
            cur.pop_back();
        }
    }
}



int main()
{
    if (dic.isEmpty()){
        return 1;
    }

    //cin
    cin >> N;
    board = new char* [N];
    for (int i=0; i<N; ++i)
        board[i] = new char [N];
    for (int i=0; i<N; ++i){
        for (int j=0; j<N; ++j)
            cin >> board[i][j];
    }

    //player round
    while (true){
        string guess;

        //tips
        for (int i=0; i<N; ++i){
            for (int j=0; j<N; ++j)
                cout << board[i][j];
            cout << endl;
        }
        cout << "Your Score: " << player_score << endl;
        cout << "Your Words: " ;
        for (auto it : player_word_rec){
            cout << it << ' ';
        }
        cout << endl;

        //deal with input
        cin >> guess;
        if (guess == "???"){
            break;
        }
        if (guess.length() < 4){
            cout << guess << " is too short." << endl;
            continue;
        }
        if (!dic.contains(StringToLower(guess))){
            cout << guess << " is not a word." << endl;
            continue;
        }
        if (!isExisting(StringToUpper(guess))){
            cout << guess << " is not on board." << endl;
            continue;
        }
        if (player_word_set.contains(StringToLower(guess))){
            cout << guess << " is already found." << endl;
            continue;
        }

        guess = StringToLower(guess);
        player_word_rec.push_back(guess);
        player_word_set.add(guess);

        player_score += guess.length() - 3;
    }

    //computer round
    find_left();
    cout << "Computer Score: " << computer_score << endl;
    cout << "Computer Words: ";
    for (auto it : computer_word_set){
        cout << StringToUpper(it) << ' ';
    }
    cout << endl;

    return 0;
}
