//Rectangle pattern program in c : program asks the user to enter length and breadth of the hollow rectangle they want to create.
//Srishti Arya

#include <stdio.h>
 
void print_rectangle(int n, int m )
{
    int i, j;
    for (i = 1; i <= n; i++)
    {
        for (j = 1; j <= m ; j++)
        {
            if (i==1 || i==n || j==1 || j==m )           
                printf("*");           
            else
                printf(" ");           
        }
        printf("\n");
    }
 
}

int main()
{
    int columns,rows;
    printf("Enter length and breadth of a rectangle: ");
    scanf("%d %d",&rows,&columns);
    print_rectangle(rows, columns);
    
    return 0;
}
