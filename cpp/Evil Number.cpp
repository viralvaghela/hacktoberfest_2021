#include <iostream>
using namespace std;
int main()
{
     int range1,range2,i,j,flag=0;
    cout<<"Enter a range:";
    cin>>range1;
    cin>>range2;
    cout<<"Evil numbers between "<<range1<<" and "<<range2<<" are: ";
    for(i=range1;i<=range2;i++)
    {
      int one_c=0;
      int num=i;
   while(num!=0)
   {
       if(num%2==1)
       {
           one_c++;
       }
           num/=2;

   }
   if(one_c%2==0)
    cout<<i<<" ";
}
}
