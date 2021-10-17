//Given an r x c increasingly sorted matrix and a number key, find the position of key in the matrix 
//if it is present in the matrix

#include <iostream>
using namespace std;

void staircaseSearch(int a[100][100], int r, int c, int key){

    int j = c-1;
    int i = 0;
    int flag = false;
    if(key<a[0][0] or key>a[r-1][c-1]){
             cout<<"Key not found"<<endl;
             flag = true;
    }
          
    while(i<=r-1 and j>=0){
        if(a[i][j] == key){
                  cout<<"Found at a["<<i<<"]["<<j<<"]"<<endl;
                  flag = true;
                  break;
        }
          else if(a[i][j] > key)
              j--;
        else
          i++;
    }
  if(flag == false)
     cout<<"Key not found"<<endl;
   
}

int main()
{
   int r,c;
   cout<<"Enter the number of rows and columns: ";
   cin>>r>>c;
   int a[100][100];
   cout<<"Enter the 2D array elements in sorted order: "<<endl;
   for(int i=0;i<r;i++){
       for(int j=0;j<c ; j++){
           cin>>a[i][j];
       }
   }
   
   int key;
   cout<<"Enter key to search: ";
   cin>>key;
   staircaseSearch(a , r,c ,key );
}