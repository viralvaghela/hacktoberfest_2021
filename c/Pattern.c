#include<stdio.h>
#include<conio.h>
int main()
{
  int i,w,p;
  char str[]="SURYA";
  printf("\n");
  for(i=0;i<5;i++)
  {
    p=i+1;
    printf("\n%-5.*s",p,str);
  }
  
  for(i=4;i>=0;i--)
  {
    p=i+1;
    printf("\n%-5.*s",p,str);
  }
  getch();
  return 0;
}
/*
The output of the code will be as follows---    
S
SU   
SUR  
SURY 
SURYA
SURYA
SURY 
SUR  
SU   
S   
*/
