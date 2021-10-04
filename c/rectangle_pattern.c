/* print 
5 col, 4 row
* * * * *
*       *
*       *
* * * * *

*/

#include <stdio.h>

int main()
{  int row=4,col=5;
    int i,j;
    for(i=0;i<row;i++){
        for(j=0;j<col;j++){
            if(j==0 || j==col-1 || i==0 || i==row-1){
                printf("* ");
            }
            else
                printf("  ");
                
        }printf("\n");
    }
   

    return 0;
}
