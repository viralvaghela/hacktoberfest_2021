// C++ program to count full nodes in a Binary Tree

#include <bits/stdc++.h>
using namespace std;

// A binary tree Node has data, pointer to left child and a pointer to right child
struct Node
{
	int data;
	Node* left, *right;

    Node(int data)
    {
    	this->data = data;
    	this->left = this->right = NULL;
    }
};

int getfullCount(Node* node)
{
    // If tree is empty
	if (!node)
		return 0;

    // level order traversal starting from root
    queue<Node*> q;

    // Initialize count of full nodes
	int count = 0;
	q.push(node);

	while (!q.empty())
	{
		Node *temp = q.front();
		q.pop();

		if (temp->left && temp->right)
			count++;

		if (temp->left != NULL)
			q.push(temp->left);
		if (temp->right != NULL)
			q.push(temp->right);
	}
	return count;
}

int main()
{
    // creating the binary Tree
    
	Node *root = new Node(12);
	root->left	 = new Node(7);
	root->right	 = new Node(5);
    root->left->left = new Node(10);
	root->left->right = new Node(6);
	root->left->right->left = new Node(1);
	root->left->right->right = new Node(11);
	root->right->right = new Node(9);
	root->right->right->left = new Node(4);

	cout << getfullCount(root);

	return 0;
}

/*
    Test Case in the code
        12
       / \
     /    \
    7      5
  /  \      \
10    6      9
    /  \    /
   1   11 4
*/
