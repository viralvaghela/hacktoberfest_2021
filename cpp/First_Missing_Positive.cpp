class Solution {
public:
    int firstMissingPositive(vector<int>& nums) {
        int l=nums.size();
        int flag=0;
        for(int i=0;i<l;i++){
            if(nums[i]<=0 || nums[i]>l){
                nums[i]=l+1;
            } 
        }
        
        
        for(int i=0;i<l;i++){
            //cout<<nums[i]<<" ";
            if((abs(nums[i])-1)<l && nums[abs(nums[i])-1]>0){
              nums[abs(nums[i])-1]=-nums[abs(nums[i])-1];
            }
             //cout<<nums[i]<<" ";
        }
        
        
        for(int i=0;i<l;i++){
            if(nums[i]>0){
                return (i+1);
            }
        }
        
        return l+1;
    }
};
