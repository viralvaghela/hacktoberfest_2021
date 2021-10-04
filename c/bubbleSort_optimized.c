#include<stdio.h>

void bubbleSort(int arr[],int size)
{
    for(int i=0;i<size-1;i++)//size -1 since finally first element would be sorted automatically
    {
        for(int j=0;j<size-i-1;j++)//no need to iterate till last ele,since(size - i - 1) element are sorted.
        {
          int flag=0;//to avoid redunduncy
            if(arr[j]>arr[j+1])
            {
              //swapping with adjacent element
                int temp=arr[j];
                arr[j]=arr[j+1];
                arr[j+1]=temp;
            }
        }if(flag==0)
          //i.e. no swapping in entire iteration,implies the array is sorted
          break;
    }
  
    //print the output
    for(int i=0;i<size;i++)
  { 
        printf("%d ",arr[i]);
    }
    
}



int main(){
 
//     int arr[]={5,3,4,2,1}; or take input from user
  int size,i,j;
  scanf("enter size of array:%d",&size);
  for (i=0;i<size;i++)
  {
    scanf("%d",&arr[i]);
  }
  
//     find size of the array or make it user defined:size
    int n = sizeof(arr)/sizeof(arr[0]);
  
    bubbleSort(arr,n);
}
