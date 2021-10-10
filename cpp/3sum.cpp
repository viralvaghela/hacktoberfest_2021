//Leetcode Problem : 15. 3Sum - https://leetcode.com/problems/3sum/
class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        List<List<Integer>> result = new ArrayList<>();
        int size = nums.length;
        if(size<3)
            return result;
        int i=0;
        Arrays.sort(nums);
        while(i<size-2) {
            int j=i+1,k=size-1;
            int numI = nums[i];
            while(j<k) {
                int sum = numI + nums[j] + nums[k];
                if (sum == 0) {
                    List<Integer> subResult = new ArrayList<>();
                    subResult.add(numI);
                    subResult.add(nums[j]);
                    subResult.add(nums[k]);
                    result.add(subResult);
                    j++;
                    k--;
                    while(j<k && nums[j-1] == nums[j]) j++;
                    while(j<k && nums[k] == nums[k+1]) k--;
                }
                else if(sum<0) {
                    j++;                    
                    while(j<k && nums[j-1] == nums[j]) j++;
                }
                else  {
                     k--;
                    while(j<k && nums[k] == nums[k+1]) k--;
                }
            }
            i++;
            while(i<size-2 && nums[i] == nums[i-1]) i++;
        }
        return result;
    }
}
