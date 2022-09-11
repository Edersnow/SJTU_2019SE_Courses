#include <vector>
#include <iostream>
#include <fstream>
#include "Class.h"
#include "Student.h"

using namespace std;

class AppX {
private:
    vector<Student *> studentVec;
    vector<Class *> classVec;

    void loadFiles();
    void inputScore();
    void inputScorepri(Class *cl);
    void printAvgScore();
    void printGpa();

public:
    AppX();
    ~AppX();
    int run();
};

AppX::~AppX()
{
    // You can use the traditional loop, which is more clear.
    for (vector<Class *>::iterator it = classVec.begin();
         it != classVec.end();
         ++it) {
        if (*it) delete (*it);
    }
    // You can use modern and simpler loops only if you know what it is doing.
    for (const auto &s: studentVec) {
        if (s) delete (s);
    }
}

AppX::AppX()
{
    loadFiles();
}

void AppX::loadFiles()
{
    string line;
    size_t pos1, pos2;
    vector<string> bufv;
    Student *st = nullptr;
    string clsname;
    int point;
    Class *cl = nullptr;

    // Open a file as a input stream.
    ifstream stfile("./Students.txt");

    while (getline(stfile, line)) {
        if (line.empty()) // It's an empty line.
            continue;
        if (line[0] == '#') // It's a comment line.
            continue;

        // The bufv vector stores each columnes in the line.
        bufv.clear();
        // Split the line into columes.
        //   pos1: begining the the column.
        //   pos2: end of the column.
        pos1 = 0;
        while (true) {
            pos2 = line.find(';', pos1 + 1);
            if (pos2 == string::npos) { // No more columns.
                // Save the last column (pos1 ~ eol).
                bufv.push_back(line.substr(pos1, string::npos));
                break;
            } else {
                // Save the column (pos1 ~ pos2).
                bufv.push_back(line.substr(pos1, pos2 - pos1));
            }
            pos1 = pos2 + 1;
        }

        // TODO: uncomment next lines after implementing class Undergraduate
        // and Graduate.
        if (bufv[3] == "U")
            st = new Undergraduate(bufv[0], bufv[1], bufv[2]);
        else
            st = new Graduate(bufv[0], bufv[1], bufv[2]);

        studentVec.push_back(st);

        //for debug
        //cout << st->toString();
    }
    stfile.close();

    // TODO: load data from ./Classes.txt and push objects to the vector.
    // Hint: how is student information read?

    // Open a file as a input stream.
    ifstream stfiles("./Classes.txt");

    while (getline(stfiles, line)) {
        if (line.empty()) // It's an empty line.
            continue;
        if (line[0] == '#') // It's a comment line.
            continue;

        clsname = line.substr(6);
        getline(stfiles, line);

        point = 0;
        for (int i=0; line[i]; ++i){
            if (line[i] < '0' || line[i] > '9')  continue;
            point = point * 10 + line[i] - '0';
        }

        //for debug
        //cout << clsname << endl << point << endl;

        cl = new Class (clsname, point);
        while (getline(stfiles, line)){
            if (line.empty()) // It's an empty line.
                break;
            if (line[0] == '#') // It's a comment line.
                break;

            for (vector<Student *>::iterator it = studentVec.begin(); it != studentVec.end(); ++it){
                if ((*it)->id == line){
                    cl->addStudent(**it);
                    (*it)->addClass(cl);

                    //for debug
                    //cout << (*it)->toString();
                }
            }
        }

        classVec.push_back(cl);
    }
    stfiles.close();
}

void AppX::inputScorepri(Class *cl){
    string stid;

    while (true){
        cout << "Please input student id (or input q to quit): ";
        cin >> stid;

        if (stid == "q")  break;

        try {
            StudentWrapper &cw = cl->getStudentWrapper(stid);
            string tmp;
            double sco;

            while(true){
                cout << cw.toString();
                cout << "Please input the score of the student (or input q to quit): ";
                cin >> tmp;

                if (tmp == "q")  break;

                try {
                    sco = stoi(tmp);

                    if (sco > 100 || sco < 0)  throw("Error!");
                    cw.setScore(sco);
                    break;

                }  catch (...) {
                    cout << "Wrong score!" << endl;
                    break;
                }
            }

        }  catch (...) {
            cout << "No match student!" << endl;
            continue;
        }


    }
}

void AppX::inputScore()
{
    // TODO: implement inputScore.
    // Hint: Take a look at printAvgScore().
    string sbuf;
    Class *cl;

    while (true) {
        cout << "Please input the class name (or input q to quit): ";
        cin >> sbuf;
        if (sbuf == "q")
            break;

        cl = nullptr;
        for (vector<Class *>::iterator it = classVec.begin();
             it != classVec.end();
             ++it) {
            if ((*it)->name == sbuf) {
                cl = *it;
                break;
            }
        }
        if (cl == nullptr) {
            cout << "No match class!" << endl;
            continue;
        }

        inputScorepri(cl);
    }
}

void AppX::printAvgScore()
{
    string sbuf;
    Class *cl;
    double avg;

    while (true) {
        cout << "Please input the class name (or input q to quit): ";
        cin >> sbuf;
        if (sbuf == "q")
            break;

        cl = nullptr;
        for (vector<Class *>::iterator it = classVec.begin();
             it != classVec.end();
             ++it) {
            if ((*it)->name == sbuf) {
                cl = *it;
                break;
            }
        }
        if (cl == nullptr) {
            cout << "No match class!" << endl;
            continue;
        }

        avg = cl->getAvgScore();
        printf("The average score is: %.2f\n", avg);
    }
}

void AppX::printGpa()
{
    // TODO: implement printGpa.
    // Hint: Take a look at printAvgScore().
    string stid;
    Student *cs;
    double sco;

    while (true) {
        cout << "Please input student id (or input q to quit): ";
        cin >> stid;
        if (stid == "q")
            break;

        cs = nullptr;
        for (vector<Student *>::iterator it = studentVec.begin();
             it != studentVec.end();
             ++it) {
            if ((*it)->id == stid) {
                cs = *it;
                break;
            }
        }
        if (cs == nullptr) {
            cout << "No match student!" << endl;
            continue;
        }

        sco = cs->getGrade();
        cout << cs->toString();
        printf("GPA = %.2f\n", sco);
    }
}

int AppX::run()
{
    char cmd;
    while (true) {
        cout << "Command menu:\n"
            << "\ti: Input score\n"
            << "\ta: Compute average score of a class\n"
            << "\tg: Compute grade of a student\n"
            << "\tq: Quit\n"
            << "Please input the command: ";
        cin >> cmd;
        if (cmd == 'i') {
            inputScore();
        } else if (cmd == 'a') {
            printAvgScore();
        } else if (cmd == 'g') {
            printGpa();
        } else if (cmd == 'q') {
            break;
        } else {
            cout << "Invalid command!\n" << endl;
        }
    }
    return 0;
}

int main()
{
    AppX app;
    return app.run();
}
