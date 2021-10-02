#include<iostream>
using namespace std;
#define n 7
void quicksort(int x[],int ub,int lb);
int  partition(int x[],int ub,int lb);

int main()
{
    int x[n];
    cout<<"enter values:";
    for(int i=0;i<n;i++)
       cin>>x[i];
    quicksort(x,n-1,0);
    for(int i=0;i<n;i++)
       cout<<x[i]<<" ";
}

void quicksort(int x[],int ub,int lb)
{
    if(lb<ub)
    {
      int y= partition(x,ub,lb);
       //cout<<*j<<lb;
       quicksort(x,y-1,lb);
       
       quicksort(x,ub,y+1);
       
    } 
}

int partition(int x[],int ub,int lb)
{
    int up=ub;
    int down=lb;
    int a=x[lb];
    int temp;
    while(up>down)
    {
        while(x[down]<=a) {down++;}
        while(x[up] > a){ up--;}
        //cout<<up<<" "<<down<<","<<endl;
        if(up>down)
        {
            temp=x[down];
            x[down] = x[up];
            x[up] = temp;
        }
        
    }
    x[lb] = x[up];
    x[up] = a;
    return up;
      // cout<<up;
}