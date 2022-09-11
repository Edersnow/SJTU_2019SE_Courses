/**
 * lab说明：
 * 1.仿照SortInt和SortStr写一个模板类Sort
 * 2.完成类Vector，用于储存向量，并且需支持根据相量的膜使用Sort
 * 
 * (很easy
 */

#include <iostream>
#include <string>

using namespace std;

// TODO: Finish Vector
class Vector {
private:
    double sta1;
    double sta2;
    double end1;
    double end2;
    double lend;

public:
    Vector(double s1=0, double s2=0, double e1=0, double e2=0):sta1(s1), sta2(s2), end1(e1), end2(e2), lend((s1-e1)*(s1-e1)+(s2-e2)*(s2-e2)) {}
    bool operator < (const Vector &other){
        return lend < other.lend;
    }
    friend ostream &operator<<(ostream &other, const Vector th){
        other<<'('<<th.sta1<<", "<<th.sta2<<")->("<<th.end1<<", "<<th.end2<<")    ";
        return other;
    }
};

class SorterInt {
private:
    int min;
    int max;
    SorterInt() { }
public:
    SorterInt(int min, int max) {
        this->min = min;
        this->max = max;
    }
    void add(int newEle) {
        if (newEle < min) min = newEle;
        if (newEle > max) max = newEle;
    }
    int getMin() const { return min; }
    int getMax() const { return max; }
};

class SorterString {
private:
    string min;
    string max;
    SorterString() { }
public:
    SorterString(string min, string max) {
        this->min = min;
        this->max = max;
    }
    void add(string newEle) {
        if (newEle < min) min = newEle;
        if (max < newEle) max = newEle;
    }
    string getMin() const { return min; }
    string getMax() const { return max; }
};



// TODO: Add class Sorter using template

template <class T>
class Sorter{
private:
    T min;
    T max;
    Sorter() { }
public:
    Sorter(T min, T max) {
        this->min = min;
        this->max = max;
    }
    void add(T newEle) {
        if (newEle < min) min = newEle;
        if (max < newEle) max = newEle;
    }
    T getMin() const { return min; }
    T getMax() const { return max; }
};

int main()
{
    SorterInt sorterInt(50, 50);
    sorterInt.add(13);
    sorterInt.add(94);
    sorterInt.add(12);
    sorterInt.add(430);
    sorterInt.add(59);
    cout << "sorterint     => min: " << sorterInt.getMin() << " max: " << sorterInt.getMax() << endl;

    SorterString sorterStr("50", "50");
    sorterStr.add("013");
    sorterStr.add("94");
    sorterStr.add("12");
    sorterStr.add("403");
    sorterStr.add("590");
    cout << "sorterstring  => min: " << sorterStr.getMin() << " max: " << sorterStr.getMax() << endl;

    Sorter<int> sorterTint(50, 50);
    sorterTint.add(13);
    sorterTint.add(94);
    sorterTint.add(12);
    sorterTint.add(430);
    sorterTint.add(59);
    cout << "sorter<int>   => min: " << sorterTint.getMin() << " max: " << sorterTint.getMax() << endl;

    Sorter<string> sorterTstr("50", "50");
    sorterTstr.add("013");
    sorterTstr.add("94");
    sorterTstr.add("12");
    sorterTstr.add("403");
    sorterTstr.add("590");
    cout << "sorter<string>=> min: " << sorterStr.getMin() << " max: " << sorterStr.getMax() << endl;

    //add:
    //(0, 0)->(2, 5), len^2=29
    //(1, 3)->(9, -5), len^2=128 (max)
    //(1.1, 3.3)->(-6.9, 7.2), len^2=79.21
    //(1.9, 0.3)->(0, -0.9), len^2=5.05 (min)
    //(-5.1, 3.3)->(5.2, 5.2), len^2=109.7
    //(0, 9.3)->(1, 2.2), len^2=51.41
    //(1.1, -3.3)->(1.6, 6.6), len^2=98.26

    Sorter<Vector> sorterTvec(Vector(0, 0, 2, 5), Vector(1, 3, 9, -5));
    sorterTvec.add(Vector(1.1, 3.3, -6.9, 7.2));
    sorterTvec.add(Vector(1.9, 0.3, 0, -0.9));
    sorterTvec.add(Vector(-5.1, 3.3, 5.2, 5.2));
    sorterTvec.add(Vector(0, 9.3, 1, 2.2));
    sorterTvec.add(Vector(1.1, -3.3, 1.6, 6.6));
    cout << "sorter<Vector>=> min: " << sorterTvec.getMin() << " max: " << sorterTvec.getMax() << endl;

    return 0;
}