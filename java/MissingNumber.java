/*

Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
Example - 
Input: nums = [9,6,4,2,3,5,7,0,1]
Output: 8
Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.

*/


class Solution {
  
    public static void main(String[] args){
      int[] nums = {9,6,4,2,3,5,7,0,1};
      int ans = missingNumber(nums);
      System.out.println(ans);
    }
  
  
    public int missingNumber(int[] nums) {
        
         //using basic maths->
        int n = nums.length;
        int sumN = (n * (n+1))/2;
        int sumArr = 0;
        for(int i=0; i<n; i++) {
            sumArr += nums[i];
        }
        
        return sumN - sumArr;
        
    }
}
