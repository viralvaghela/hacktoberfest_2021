#include<bits/stdc++.h>
using namespace std;

int main(){

    int n; 
    cout<<"Enter size\n ";
    cin>>n;

    int arr[n];
    cout<<"Enter array elements \n ";
    for (int i = 0; i < n; i++)
    {
    cin>>arr[i];
    }

    //sort

    for(int i=0;i<n;i++)
    {
    for(int j=i+1;j<n;j++)
    {
        if(arr[j]<arr[i])
        {
            int temp=arr[j];
            arr[j]=arr[i];
            arr[i]=temp;
            
        }


    }

    }

    cout<<"SORTED array elements \n ";
    for (int i = 0; i < n; i++)
    {
    cout<<arr[i]<<" ";
    }

return 0;
}