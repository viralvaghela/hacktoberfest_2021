#include <bits/stdc++.h>
using namespace std;
 
int main()
{
   
    int r1 , c1 ;
    cin>>r1>>c1;
    
    int r2 , c2 ;
    cin>>r2>>c2;
 
    int m1[r1][c1];
    for(int i=0; i<r1; i++){
            for(int j=0; j<c1; j++){
                 cin>>m1[i][j];
            }
    }
  
    int m2[r2][c2] ;
  for(int i=0; i<r2; i++){
            for(int j=0; j<c2; j++){
                 cin>>m2[i][j];
            }
    }  
  
  
  
    if(c1 != r2){
    } else {
        int res[r1][c2];
     
        for(int i=0; i<r1; i++){
            for(int j=0; j<c2; j++){
                int sum =0;
                for(int k=0; k<r2; k++){
                    sum += (m1[i][k] * m2[k][j]);
                }
                res[i][j] = sum;
            }
        }
        
       
        for(int i=0; i<r1; i++){
            for(int j=0; j<c2; j++){
                cout << res[i][j] << "\t";
            }
            cout << "\n";
        }
      
    }
    
    return 0;

}
