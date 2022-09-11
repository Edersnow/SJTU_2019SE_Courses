#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <chrono>
#include "Tree.h"
#include "Tree.cpp"

using namespace std;

void run_testcase(string testcasename)
{
    ifstream testcase;
    testcase.open(testcasename);

    BinaryDimonTree *tree = new BinaryDimonTree();
    chrono::steady_clock::time_point time_start=chrono::steady_clock::now();
    testcase >> *tree;
    chrono::steady_clock::time_point time_end=chrono::steady_clock::now();
    chrono::duration<double> time_used=chrono::duration_cast<chrono::duration<double>>(time_end-time_start);
    cout<<"Creation finished: "<<time_used.count()<<"s"<<endl;


    time_start=chrono::steady_clock::now();
    int testNum;
    testcase >> testNum;
    bool res = true;
    for (int i = 0; i < testNum; i++)
    {
        int x, y, z, w;
        testcase >> x;
        testcase >> y;
        testcase >> z;
        testcase >> w;
        TreeNode *node = tree->find_nearest_node(x, y);
        if (z == node->getX() && w == node->getY())
        {

        }
        else
        {
            cout << "case:" << x << " " << y << ",";
            cout << "expect:" << z << " " << w << ",";
            cout << "actual:" << node->getX() << " " << node->getY() << endl;
            res = false;
            break;
        }
    }
    time_end=chrono::steady_clock::now();
    time_used=chrono::duration_cast<chrono::duration<double>>(time_end-time_start);
    cout<<"find finished: "<<time_used.count()<<"s"<<endl;
    if(res){
        cout << "pass\n" << endl;
    }
    delete tree;
    testcase.close();
}

int main()
{
    cout << "The first group of test cases' results." << endl;
    run_testcase("spec/1.txt");

    cout << "The second group of test cases' results." << endl;
    run_testcase("spec/2.txt");

    cout << "The third group of test cases' results." << endl;
    run_testcase("spec/3.txt");

    cout << "The forth group of test cases' results." << endl;
    run_testcase("spec/4.txt");

    cout << "The fifth group of test cases' results." << endl;
    run_testcase("spec/5.txt");

    cout << "The sixth group of test cases' results." << endl;
    run_testcase("spec/6.txt");

    cout << "The seventh group of test cases' results." << endl;
    run_testcase("spec/7.txt");

    return 0;
}
