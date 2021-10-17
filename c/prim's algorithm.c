#include <stdio.h>
# define I 100000
static int n;
void prim(int cost[n+1][n+1],int t[][n-1])
{
  int near[n+1];
  int i,j,u,v,min,k;
  for(i=0;i<=n;i++)
  {
    near[i]=I;
  }
  min=I;
  for(i=1;i<=n;i++)
  {
    for(j=1;j<=n;j++)
    {
      if(cost[i][j]<min)
      {
        min=cost[i][j];
        u=i;
        v=j;
      }
    }
  }
  t[0][0]=u;
  t[1][0]=v;
  near[u]=near[v]=0;
  for(i=1;i<=7;i++)
  {
    if(near[i]!=0)
    {
      if(cost[i][v]>cost[i][u])
        near[i]=u;
      else
        near[i]=v;
       
    }
  }
  for(i=1;i<=n-2;i++)
  {
    min=I;
    for(j=1;j<=n;j++)
    {
      if(near[j]!=0)
      {
        if(cost[j][near[j]]<min)
        {
          min=cost[j][near[j]];
          k=j;
        }
      }
    }
    t[0][i]=near[k];
    t[1][i]=k;
    near[k]=0;
    for(j=1;j<=n;j++)
    {
      if(near[j]!=0)
      {
        if(cost[j][k]<cost[j][near[j]])
           near[j]=k;
      }
    }
  }
}
int main()
{

   printf("No. of vertex/Nodes in a graph :");
   scanf("%d",&n);
 
  int cost[n+1][n+1];
  int t[2][n-1];
  int i,j,sum=0;
  for(i=1;i<=n;i++)
  {
    for(j=1;j<=n;j++)
    {
      printf("Enter the weight 0f path from v[%d] to v[%d] or 0 if no path exists:",i,j);
      scanf("%d",&cost[i][j]);
      if(cost[i][j]==0)
      {
        cost[i][j]=I;
      }
    }
  }
   prim(cost,t);
  printf("Minimum cost path is");
  for(i=0;i<n-1;i++)
  {
    printf("\n v[%d] to v[%d]", t[0][i],t[1][i]);
    sum=sum +cost[t[0][i]][t[1][i]];
  }
  printf("\n \nMinimum Cost of the spanning tree is %d",sum);
  
  return 0;
}