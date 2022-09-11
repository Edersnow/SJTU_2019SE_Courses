//
// Created by Smile on 2019/4/8.
//

//
// Finished by Edersnow on 2020/10/30
//

#ifndef C_BINARYDIMEN_TREE_H
#define C_BINARYDIMEN_TREE_H

#include <stdio.h>
#include <iostream>
#include <vector>
using namespace std;

/****************************************************************
 *                    Write your code below
 ****************************************************************/

class BinaryDimonTree;
class TreeNode
{
  friend ostream &operator<<(ostream &out, const TreeNode &b);
  friend istream &operator>>(istream &in, BinaryDimonTree &tree);
  friend class BinaryTree;
  friend class BinaryDimonTree;
  static const int dimension = 2;

private:
  /* data */
  int data[dimension];
  TreeNode *left;
  TreeNode *right;

public:
  /* methods */
  int getX();  /* DO NOT CHANGE */
  int getY();  /* DO NOT CHANGE */
  ~TreeNode(); /* DO NOT CHANGE */

  TreeNode(const int dat[dimension]);
};


class BinaryDimonTree
{
friend istream &operator>>(istream &in, BinaryDimonTree &tree); /* DO NOT CHANGE */

private:
  /* data */
  TreeNode *root;

  void create(TreeNode *&cur, TreeNode **data, int left, int right, int layer);
  void clear(TreeNode *&curnode);
  void recur_search(TreeNode *cur, TreeNode &other, long long int &min_distance, TreeNode **&guess, int layer);
  void mergesort(TreeNode **data, int left, int right, int layer);
  void merge(TreeNode **data, int left, int mid, int right, int layer);

public:
  /* methods */
  BinaryDimonTree();          /* DO NOT CHANGE */
  TreeNode *find_nearest_node(int x, int y);  /* DO NOT CHANGE */

  ~BinaryDimonTree();
};

#endif //C_BINARYDIMEN_TREE_H
