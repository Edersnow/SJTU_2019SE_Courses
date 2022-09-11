#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <limits.h>
#include <vector>
#include <queue>
#include <algorithm>

#include "Tree.h"

using namespace std;

/****************************************************************
 *                    Write your code below
 ****************************************************************/

int TreeNode::getX(){
    return data[0];
}

int TreeNode::getY(){
    return data[1];
}

TreeNode::TreeNode(const int dat[dimension]):
    left(nullptr),
    right(nullptr){

    for(int i=0; i<dimension; ++i){
        data[i] = dat[i];
    }
}

TreeNode::~TreeNode(){

}





//mlog(m)^2
void BinaryDimonTree::create(TreeNode *&cur, TreeNode **data, int left, int right, int layer){
    int mid = (left + right) >> 1;
    int size = right - left + 1;

    if (size <= 0){
        return;
    }
    if (size == 1){
        cur = new TreeNode (data[left]->data);
        return;
    }

    mergesort(data, left, right, layer);

    cur = new TreeNode (data[mid]->data);
    create(cur->left, data, left, mid-1, (layer+1)%TreeNode::dimension);
    create(cur->right, data, mid+1, right, (layer+1)%TreeNode::dimension);
}

void BinaryDimonTree::clear(TreeNode *&curnode){
    if (curnode == nullptr){
        return;
    }
    clear(curnode->left);
    clear(curnode->right);
    delete curnode;
    curnode = nullptr;
}





//TODO:need modification
void BinaryDimonTree::recur_search(TreeNode *cur, TreeNode &other, long long int &min_distance, TreeNode **&guess, int layer){
    if (cur == nullptr){
        return;
    }

    long long curd = 0;
    for (int i=0; i<TreeNode::dimension; ++i){
        curd += ((long long)other.data[i] - cur->data[i]) * ((long long)other.data[i] - cur->data[i]);
    }

    if (guess == nullptr){
        min_distance = curd;
        guess = new TreeNode* (cur);
    }
    else if (curd < min_distance){
        min_distance = curd;
        *guess = cur;
    }
    //special case
    else if (curd == min_distance){
        for (int i=0; i<TreeNode::dimension; ++i){
            if (cur->data[i] < (**guess).data[i]){
                *guess = cur;
                break;
            }
            else if (cur->data[i] > (**guess).data[i]){
                break;
            }
            else{
                continue;
            }
        }
    }

    if (other.data[layer] < cur->data[layer]){
        recur_search(cur->left, other, min_distance, guess, (layer + 1)%TreeNode::dimension);
        if (abs((long long)cur->data[layer] - other.data[layer]) * abs((long long)cur->data[layer] - other.data[layer]) < min_distance){
            recur_search(cur->right, other, min_distance, guess, (layer + 1)%TreeNode::dimension);
        }
    }
    else{
        recur_search(cur->right, other, min_distance, guess, (layer + 1)%TreeNode::dimension);
        if (abs((long long)cur->data[layer] - other.data[layer]) * abs((long long)cur->data[layer] - other.data[layer]) < min_distance){
            recur_search(cur->left, other, min_distance, guess, (layer + 1)%TreeNode::dimension);
        }
    }
}

BinaryDimonTree::BinaryDimonTree():
    root(nullptr){}

BinaryDimonTree::~BinaryDimonTree(){
    clear(root);
}





//TODO: need modification
//maybe nlog(m) on average?
TreeNode *BinaryDimonTree::find_nearest_node(int x, int y){
    TreeNode **res = nullptr;
    long long curdis = (long long)1 << 62;
    int dat[] = {x, y};
    TreeNode other(dat);

    recur_search(root, other, curdis, res, 0);
    return *res;
}






void BinaryDimonTree::merge(TreeNode **data, int left, int mid, int right, int layer){
    int i=left, j=mid+1, z=left;
    TreeNode **tmp;
    tmp = new TreeNode* [right+1];

    while (i <= mid && j <= right){
        if (data[i]->data[layer] > data[j]->data[layer]){
            tmp[z++] = data[j++];
        }
        else{
            tmp[z++] = data[i++];
        }
    }

    while (i<=mid)  tmp[z++] = data[i++];
    while (j<=right)  tmp[z++] = data[j++];

    for (i=left; i<=right; ++i){
        data[i] = tmp[i];
    }

    delete tmp;
}
void BinaryDimonTree::mergesort(TreeNode **data, int left, int right, int layer){
    int mid = (left + right) >> 1;
    if (right <= left)  return;
    mergesort(data, left, mid, layer);
    mergesort(data, mid+1, right, layer);
    merge(data, left, mid, right, layer);
}





istream &operator>>(istream &in, BinaryDimonTree &tree){
    int n;
    int tmp[TreeNode::dimension];
    TreeNode **data;

    std::ios::sync_with_stdio(false);

    in >> n;
    data = new TreeNode* [n];

    for (int i=0; i<n; ++i){
        for (int j=0; j<TreeNode::dimension; ++j){
            in >> tmp[j];
        }
        data[i] = new TreeNode (tmp);
    }
    tree.create(tree.root, data, 0, n-1, 0);

    for (int i=0; i<n; ++i){
        delete data[i];
    }
    delete data;

    return in;
}
