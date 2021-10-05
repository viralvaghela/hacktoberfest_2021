class Solution {
public:
    vector<int> searchRange(vector<int>& nums, int target) {
       int res=INT_MAX;
        vector<int> ans;
        //first Occurence
        
       int left=0,right=nums.size()-1,mid;
        while(left<=right)
        {
            mid=left + (right-left)/2;
            if(nums[mid]==target)
            {
                res=mid;
                right=mid-1;
            } 
            else if(nums[mid] > target)
                right=mid-1;
            else left=mid+1;
        }
        ans.push_back(res!=INT_MAX?res:-1);
        
        //last Occurence
        left=0,right=nums.size()-1,mid=0,res=INT_MAX;
          while(left<=right)
        {
            mid=left + (right-left)/2;
            if(nums[mid]==target)
            {
                res=mid;
                left=mid+1;
            } 
            else if(nums[mid] > target)
                right=mid-1;
            else left=mid+1;
        }
        ans.push_back(res!=INT_MAX?res:-1);
    
    return ans;
  
    }
};