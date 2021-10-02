// Find max xor of 2 numbers in given array 
// Time complexity : O(N * log(Max a[i]))
#include <bits/stdc++.h>
using namespace std;

// trie node 
struct node {
  bool val = 0;
  node *child[2] = {NULL};
};

// insert node in trie
void insert(node *root, int val) {
  for (int i = 30; i >= 0; --i) {
    bool c = val & (1 << i);
    if (!root->child[c]) root->child[c] = new node;
    root = root->child[c];
    root->val = c;
  }
}

// finds number that gives max xor with x
int find(node *root, int x) {
  int ans = 0;
  for (int i = 30; i >= 0; --i) {
    bool c = x & (1 << i);
    if (root->child[1 - c]) {
      ans += (1 << i);
      root = root->child[1 - c];
    } else
      root = root->child[c];
  }
  return ans;
}

// find max xor of 2 numbers in array
int findMaximumXOR(vector<int> &a) {
  node *root = new node;
  for (auto &i : a) insert(root, i);
  int bit = 31;
  int ans = 0;
  for (auto &i : a) {
    ans = max(ans, find(root, i));
  }
  return ans;
}

int main() {
	int n; 
	cin >> n;
	vector<int> a(n);
	for(auto &i : a) cin >> i;
	cout << "Max XOR of 2 numbers : "<< findMaximumXOR(a) << "\n";
}
