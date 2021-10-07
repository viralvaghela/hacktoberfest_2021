//coverting number to rupees

#include <stdio.h>
int main()
{
    long p;
    scanf("%ld",&p);
   
    int count=0;
    long cp=p;
    while(cp!=0){
        cp=cp/10;
        count++;
    }
    //printf("%d",count);
    count=count;
    if(count<=4){
        printf("%ld.%.2ld", p / 100, p % 100);


    }
    else{
        int cc=count;
        count=count+1;
        cc=count-2;
        count=count+(cc/3);
       
        //printf("%d",count);
       
        int arr[count];
        int cp=count+1;
        int jump_i=0;
        int ii=0;
       
        for(int i=count;i>=1;i--){
            cp=cp-1;
          if(i==count-2){
              arr[i]=-2;
          }
          else if(ii==3){
              arr[i]=-1;
              ii=0;
         
        }
        else{
            arr[cp]=p%10;
            p=p/10;
            if(i<count-2){
                ii=ii+1;
            }
        }
       
        }
        for(int i=1;i<=count;i++){
            if(arr[i]==-2){
                printf(".");
            }
            else if(arr[i]==-1){
                if(i!=1){
                    printf(",");
                }
                
            }
            else{
                printf("%d",arr[i]);
            }
       
    }
}
}

/*******************************************************************************************************************************************************************
 sample input and output
 
 
 input 1: 12345
 output 1: 123.45
 
 input 2: 123456
 output 2: 1,234,.56
 
 input 3: 123456789
 output 3: 1,234,567.89
 
 input 4: 5
 output 4: 0.05
 
 input 5: 85
 output 5: 0.85
 
 ******************************************************************************************************************************************************************/
 
 
 