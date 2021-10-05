
// Solution for https://leetcode.com/problems/split-array-largest-sum/ (Leetcode HARD Problem)
import java.util.Scanner;

public class SplitArrayLargetSum {
    public static void main(String[] args) {
        
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        int[] nums = new int[n];
        int m = in.nextInt();;
        System.out.println(splitArray(nums, m));

    }

    public static int splitArray(int[] nums, int m) {
        int start = 0;
        int end = 0;
        for (int num : nums) {
            if (num > start)
                start = num;
            end += num;
        }
        while (start < end) {
            int mid = start + (end - start) / 2;
            int sum = 0;
            int pieces = 1;
            for (int num : nums) {

                if(sum+num>mid){
                    pieces++;
                    sum=num;
                }
                else
                    sum+=num;

            }

            if(pieces>m)
                start = mid+1;
            else
                end = mid;

        }
        return end;
    }


}
