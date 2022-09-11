#include "Student.h"
#include <string>
#include <sstream>
#include "Class.h"

std::string Student::toString() const
{
    // TODO: uncomment the following code after implementing class Student.
    std::ostringstream oss;
    oss << "Student Information:"
        << "\n\tid: " << id
        << "\n\tname: " << name
        << "\n\tenrollment year: " << year
        << "\n\tdegree: " << (degree == graduate ? "graduate" : "undergraduate")
        << std::endl;
    return oss.str();
    return "";
}

// TODO: implement functions which are declared in Student.h.
void Student::addClass(Class* c){
    classes.push_back(c);
}

double Undergraduate::getGrade(){
    double res = 0;
    int cnt = 0;

    for (std::vector<Class *>::iterator it = classes.begin(); it != classes.end(); ++it){
        StudentWrapper tmp = (*it)->getStudentWrapper(id);

        cnt += (*it)->point;

        res += (*it)->point * tmp.getScore() / 20;
    }
    res /= cnt;

    return res;
}

double Graduate::getGrade(){
    double res = 0;
    int cnt = 0;

    for (std::vector<Class *>::iterator it = classes.begin(); it != classes.end(); ++it){
        StudentWrapper tmp = (*it)->getStudentWrapper(id);

        cnt += (*it)->point;

        if (tmp.getScore() >= 90)  res += (*it)->point * 4.0;
        else if (tmp.getScore() >= 80)  res += (*it)->point * 3.5;
        else if (tmp.getScore() >= 70)  res += (*it)->point * 3.0;
        else if (tmp.getScore() >= 60)  res += (*it)->point * 2.5;
        else  res += (*it)->point * 2.0;
    }
    res /= cnt;

    return res;
}
