/*
Sample Input 1:
2
4
1 2 3 4
4
2 2 2 2
Sample Output 1:
3
0
*/

import java.util.*;
import java.lang.*;
import java.io.*;
public class Solution{
    public static int maxProfit(int stockprices[]){
        if(stockprices.length==0){
            return 0;
        }
        int max=0;
        int sofarMin=stockprices[0];
        for(int i=0;i<stockprices.length;i++){
            if(stockprices[i]>sofarMin){
                max=Math.max(max,stockprices[i]-sofarMin);
            }
            else{
                sofarMin=stockprices[i];
            }
        }
        return max;
    }
}
