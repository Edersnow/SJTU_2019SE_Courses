## **LAB3:hanoi**

很简单的一个lab...没啥好记录的好像？

可能比较需要注意的是输出规范

### Notes:

+ 关于输入异常的处理、代码的鲁棒性

```
    //
    //这里直接用cin.clear()与cin.sync()来清空流以及错误信息
    //也可结合cin.good()等判断
    //
    while (com1 > '5' || com1 < '1'){
        cout << "How many disks do you want? (1 ~ 5)" << endl;
        cin >> com1;
        cin.clear();
        cin.sync();

        if (com1 == 'Q')  return;
    }
```