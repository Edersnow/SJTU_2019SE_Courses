## **LAB4: 2d-tree**:

这个lab主要是用到一种叫做**kd-tree**的算法。

[OI wiki](https://oi-wiki.org/ds/kdt/)上有关于kd-tree的一些基本介绍

这里的具体实现虽然是2d-tree情况的，但是很容易就可以改造为其它维度的树（应该只需要改变>>的重载函数以及find的输入函数）

建树过程中是比较普通的nlogn^2算法，并没有用到wiki上提到的nlogn算法（m<=5000条件下nlogn^2够用了）

另外，在极端情况下，kd-tree还是需要将所有点全部遍历一遍（输入点全部为圆周上的点，查找点为圆心），因此上面的优化无法避免单次查询最坏的o(m)复杂度。在这个lab的要求中没有规定输入点是非重复点，那么实际上，我们可以假设输入的m个点全部为圆周上的点（不过int范围内似乎做不到），查找点全部输入圆心坐标，这种情况下复杂度是o(nm)的。

当然，TA并没有进行这么极端的测试，并且上面这种情况可以通过记录已经计算过的结果来避免很坏的复杂度。假设结果可记录（用map等方式），那么kd-tree的最坏复杂度似乎不太好分析了……

附：因为坐标都是整数，输入点全部为圆周上的点的相关问题**等价于将一个正整数分解为多组不同的两个数的平方和问题**，这个问题可以参考[这个回答](https://www.zhihu.com/question/52958268/answer/132805583)

### Notes:

+ 在排序部分，本来天马行空地希望通过algorithm库中的sort函数实现，其中的比较函数用一个模板函数来实现（以支持根据不同维度上的数据排序），然后通过一个函数指针数组去调用不同的具体化的函数模板。这种想法的初衷是在利用sort函数的基础上避免写好几个比较函数，但是函数指针应该是没法指向函数模板的

+ C++11引入的计时方式：
```
    #include <chrono>
    //codes

    chrono::steady_clock::time_point time_start=chrono::steady_clock::now();
    //codes
    chrono::steady_clock::time_point time_end=chrono::steady_clock::now();
    chrono::duration<double> time_used=chrono::duration_cast<chrono::duration<double>>(time_end-time_start);
    cout<<time_used.count()<<"s"<<endl;
```

+ 尚可优化的地方：因为这里给出了n的上限，2D-Tree存在数组里面就可以了