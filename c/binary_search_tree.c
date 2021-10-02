#include<stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node *left, *right;
} Node;

Node *newNode(int data);
Node *insert(Node *root, int data);
void inOrder(Node *root);
Node *search(Node *root, int data);
int findMin(Node *root);
int findMax(Node *root);
int findHeight(Node *root);

int main() {
    Node *root = NULL;

    int  n = 0, data = 0, key = 0;

    int choice = 0;

    do {
        printf("\nMenu:\n");
        printf("1] Insert elements in BST\n");
        printf("2] Display the BST\n");
        printf("3] Search a key\n");
        printf("4] Find the maximum element\n");
        printf("5] Find the minimum element\n");
        printf("6] Find Height of BST\n");
        printf("7] Exit");
        printf("\nEnter your choice: ");
        scanf("%d", &choice);
    
        switch(choice) {
            
            case 1:
                printf("\nEnter the no. of elements you want to insert in the Binary search tree: ");
                scanf("%d", &n);
    
                printf("\nEnter the element in root node: ");
                scanf("%d", &data);
                root = newNode(data);
     
                for(int i = 0; i < n - 1; i++) {
                    printf("Enter the next element: ");
                    scanf("%d", &data);
                    root = insert(root, data);
                }
                break;

            case 2:
                if(root != NULL) {
                printf("\nBinary search tree is: \n");
                inOrder(root); 
                } 
                else
                printf("Tree is empty\n");
                break;

            case 3:
            if(root == NULL) 
                printf("Tree is empty\n");
            else {
                printf("\nEnter the key you want to search: ");
                scanf("%d", &key);

                (search(root, key) == NULL) ? printf("\nKey not found\n") : printf("\nKey found: %d\n", search(root, key)->data);
                
            }
                break;

            case 4:
                (root == NULL) ? printf("Tree is empty\n")  : printf("\nMax element: %d\n", findMax(root));
                break;
                
            case 5:
                (root == NULL) ? printf("Tree is empty\n")  : printf("\nMin element: %d\n", findMin(root));
                break;
                
            case 6:
                printf("\nHeight of the Tree: %d\n", findHeight(root));
                break;

            case 7: exit(0);
            
            default:
                printf("\nWrong choice !\n");
            
        }

    } while(1);

}

Node *newNode(int data) {
    Node *temp = (Node*)malloc(sizeof(Node));
    temp -> data = data;
    temp -> left = NULL;
    temp -> right = NULL;

    return temp;
}

Node *insert(Node *root, int data) {
    if(root == NULL) {
        root = newNode(data);
    } else if(data > root->data) {
        root -> right = insert(root-> right, data);
    } else {
        root -> left = insert(root -> left, data);
    }

    return root;
}

void inOrder(Node *root) {
    if(root != NULL) {
        inOrder(root->left);
        printf("%d ", root->data);
        inOrder(root->right);
    } 
}

Node *search(Node* root, int key){
    if (root == NULL || root -> data == key)
       return root;
       if (root->data < key)
       return search(root->right, key);
 
    return search(root->left, key);
}

int findMin(Node *root) {

    Node *temp = root;

    if(root == NULL)
        return -1;
    else if(root -> left == NULL) {
        return root -> data;
    } else {
        while(temp -> left != NULL) {
            temp = temp -> left;
        }
        return temp->data;
    }
}

int findMax(Node *root) {
    Node *temp = root;

    if(root == NULL)
        return -1;
    else if(root -> right == NULL) {
        return root -> data;
    } else {
        while(temp -> right != NULL) {
            temp = temp -> right;
        }
        return temp->data;
    }
}

int findHeight(Node *root) {
    if(root == NULL)
        return -1;
    else {
        
        int leftHeight = findHeight(root->left);
        int rightHeight = findHeight(root->right);
        
        return leftHeight > rightHeight ? (leftHeight + 1) : (rightHeight + 1);
    }        
}




