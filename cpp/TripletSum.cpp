// Problem link : https://practice.geeksforgeeks.org/problems/triplet-sum-in-array-1587115621/1

#include <bits/stdc++.h>
using namespace std;


 // } Driver Code Ends


class Solution{
    public:
    // function to find the triplet which sum to x
    // arr[] : The input Array
    // N : Size of the Array
    // X : Sum which you need to search for 
    
    bool find3Numbers(int arr[], int N, int X)
    {
        //Your Code Here
        
        int Sum = 0;
        sort(arr, arr+N);
        //printArray(arr);
    
        for(int i=0; i<N-2; i++){
    
        	int leftPtr = i+1;
        	int rightPtr = N-1;
    
            while(leftPtr<rightPtr) {
                
                Sum = arr[rightPtr] + arr[leftPtr] +arr[i];
                //printf("leftptr:%d ,rightptr:%d, partial sum:%d\n",leftPtr, rightPtr, Sum);
                if(Sum == X) {
                    return true;
                } else if( Sum > X) {
                	rightPtr--;
                } else {
                	leftPtr++;
                }          
            }
        }
    
        return false;
    }

};

// n = 5, X = 10
// arr[] = [1 2 4 3 6]
// Output:
// 1
// Explanation:
// The triplet {1, 3, 6} in 
// the array sums up to 10.

int main()
{
    int N=5,sum=10;
    int i,A[N] = {1,2,4,3,6};
    
    Solution ob;
    cout <<  ob.find3Numbers(A, N, sum) << endl;  

    return 0;
}
