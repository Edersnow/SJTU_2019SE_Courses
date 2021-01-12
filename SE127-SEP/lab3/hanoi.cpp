#include "termio.h"

//stack
//store sta and end (1-3)
const int maxnum = 1000000;
class stacks{
private:
    int starts[maxnum];
    int ends[maxnum];
    int tops;

public:
    void clear() {tops = 0;}
    void push(int sta, int end) {starts[tops] = sta; ends[tops] = end; ++tops;}
    bool isEmpty() {return tops == 0;}
    void pop(int &sta, int &end) {--tops; sta = starts[tops]; end = ends[tops];}
};



// Do not delete the following line
char Termio::buffer[Termio::CANVAS_HEIGHT][Termio::CANVAS_WIDTH + 1];

//store the statement corresponding to the buffer
//arr[][] : 1-5
//top[] : 0-5
int arr[3][5];
int top[3];

//store the num of disk
int NumOfDisk;

//store the history
stacks recorder;



/**
 * @brief
 * initialize the variable
 */
void initialize(){
    Termio::ResetBuffer();
    for (int i=1; i<3; ++i){
        top[i] = 0;
    }
    recorder.clear();

    top[0] = NumOfDisk;
    for (int i=0; i<NumOfDisk; ++i){
        arr[0][i] = NumOfDisk - i;
        Termio::addDisk(0, i, NumOfDisk - i);
    }
}

/**
 * @brief
 * if (needStore) store history
 * change the statement of buffer[][] and arr[][]
 * throw "error" when a invalid action was inputed and DON'T change the array
 * display ONLY WHEN action validly
 */
void action(int sta, int end, bool needStore){
    //handle exception
    if (sta < 0 || sta > 3 || end < 0 || end > 3){
        throw "error";
    }
    --sta, --end;
    if (top[sta] == 0){
        throw "error";
    }
    if (top[end] > 0 && arr[sta][top[sta]-1] >= arr[end][top[end]-1]){
        throw "error";
    }

    //store history
    if (needStore){
        recorder.push(sta+1, end+1);
    }

    //change buffer[][]
    Termio::deleteDisk(sta, top[sta]-1);
    Termio::addDisk(end, top[end], arr[sta][top[sta]-1]);

    //change arr[][]
    arr[end][top[end]++] = arr[sta][--top[sta]];

    Termio::Draw();
}

/**
 * @brief
 * the function to solve Hanoi problem
 * display
 */
void Hanoi(int n, int a, int b, int c){
    if (n == 1){
        cout << "Auto moving:" << a << "->" << b << endl;
        action(a, b, false);
        return;
    }
    Hanoi(n-1, a, c, b);
    cout << "Auto moving:" << a << "->" << b << endl;
    action(a, b, false);
    Hanoi(n-1, c, b, a);
}

/**
 * @brief
 * restore the game and solve
 * display
 */
void solve(){
    int sta, end;

    while (!recorder.isEmpty()){
        recorder.pop(sta, end);
        cout << "Auto moving:" << end << "->" << sta << endl;
        action(end, sta, false);
    }

    Hanoi(NumOfDisk, 1, 2, 3);
}

/**
 * @brief
 * return true IFF the game is over
 */
bool judge(){
    if (top[1] == NumOfDisk)  return true;
    return false;
}

/**
 * @brief
 * control the flow
 * react to the input
 *
 * #LOGIC:
 * loop:
 *   query and get command (a number (1-5) or 'Q')
 *   (exception handling
 *   initialize() (or quit)
 *   loop:
 *     query and get command (two number)
 *     action(sta, end)&judge()  or  solve()  or  display (invalid input)
 *   end
 *   congratulation
 *  end
 */
void console(){
    while (true){
        char com1 = '\0';

        while (com1 > '5' || com1 < '1'){
            cout << "How many disks do you want? (1 ~ 5)" << endl;
            cin >> com1;
            cin.clear();
            cin.sync();

            if (com1 == 'Q')  return;
        }

        NumOfDisk = com1 - '0';
        initialize();
        Termio::Draw();

        while (true){
            int sta = -1;
            int end = -1;

            cout << "Move a disk. Format: x y" << endl;
            cin >> sta >> end;
            cin.clear();
            cin.sync();
            Termio::Clear();

            if (sta == 0 && end == 0){
                solve();
                break;
            }
            else{
                try {
                    action(sta, end, true);
                    if (judge())  break;
                }  catch (...) {
                    Termio::Draw();
                }
            }
        }

        cout << "Congratulations! You win!" << endl;
    }
}

int main() {
    console();
    return 0;
}
