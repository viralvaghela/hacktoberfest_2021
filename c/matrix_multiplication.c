#include<stdio.h>


int main()
{
    int i,j,k;
    int n,m,p,q;
    printf("Enter the dimensions of 1st matrix : ");
    scanf("%d%d",&m,&n);
    int a[m][n];
    printf("Enter the matrix : \n");
    for(i=0;i<m;i++)
    {
        for(j=0;j<n;j++)
        {
            scanf("%d",&a[i][j]);
        }
    }

    printf("Enter the dimensions of 2nd matrix : ");
    scanf("%d%d",&p,&q);
    int b[p][q];
    printf("Enter the matrix : \n");
    for(i=0;i<p;i++)
    {
        for(j=0;j<q;j++)
        {
            scanf("%d",&b[i][j]);
        }
    }


    if(n==p)
    {
     int c[m][q];
    for(i=0;i<m;i++)
    {
        for(j=0;j<q;j++)
        {
            c[i][j]=0;
            for(k=0;k<p;k++)
            {
                c[i][j]+= a[i][k]*b[k][j];
            }
            
        }
    }


    printf("The matrix is : \n");
    for(i=0;i<m;i++)
    {
        for(j=0;j<q;j++)
        {
            printf("%d \t",c[i][j]);
        }
        printf("\n");
    }
    }
    else{
        printf("multiplication not possible");
    }
    return 0;
}