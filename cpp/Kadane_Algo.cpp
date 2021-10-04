/*Kadane's Algo : to get the Maximum sum among all possible  Subarray*/
#include<bits/stdc++.h>
using namespace std;

/*#################################################################################################################*/

class Solution{
    public:
    // arr: input array
    // n: size of array
    //Function to find the sum of contiguous subarray with maximum sum.
    int maxSubarraySum(int arr[], int n){
        
        int result =arr[0];
       int maxEnd=arr[0];
       for(int i=1;i<n;i++)
       {
           maxEnd=max(maxEnd+arr[i],arr[i]);
           result=max(result,maxEnd);
       }
       return result;
        
    }
};
// ###################################################################################################################

int main()
{
    int t,n;
    
    cin>>t; //input testcases
    while(t--) //while testcases exist
    {
        
        cin>>n; //input size of array
        
        int a[n];
        
        for(int i=0;i<n;i++)
            cin>>a[i]; 
        Solution ob;
        
        cout << ob.maxSubarraySum(a, n) << endl;
    }
}