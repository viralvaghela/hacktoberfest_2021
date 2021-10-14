// Problem Link:   https://leetcode.com/problems/symmetric-tree/

class Solution {
public:
    bool isSymmetric(TreeNode* root) {
        return check(root->left,root->right);
    }
    bool check(TreeNode* r1,TreeNode* r2){
        if(r1==NULL && r2==NULL)// if left and root null
        {
            return true;
        }
        else if(r1==NULL || r2==NULL || r1->val!=r2->val) //one is not null
        {
            return false;
        }
        else{
            //comparing left subtree's left child with right subtree's 
            //right child AND comparing left subtree's right child with right subtree's left child
           return check(r1->left,r2->right) && check(r1->right,r2->left);
        }
    }
};
