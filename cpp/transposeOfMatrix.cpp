#include<bits/stdc++.h>
using namespace std;


int main()
{ 
    int n;
   cout<<"Enter order of Square Matrix=  ";
   cin>>n;
    int mat[n][n];

   cout<<"Enter Elements"<<endl;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            cin>>mat[i][j];
        }
        
    }
 
    //to find transpose
    cout<<endl<<"Transpose of matrix"<<endl;
    for (int i = 0; i < n; i++)
    {
        for (int j =i ; j < n; j++)        
        {
            int temp= mat[i][j];
            mat[i][j]=mat[j][i];
            mat[j][i]=temp;


        }
        
    }
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            cout<<mat[i][j]<<" ";
        }
        cout<<endl;
    }
 

    
}