#include<stdio.h>
#include<conio.h>

//Execution of every program start with main function.
int main(void)
{
  int i,w,p; //variable declaration
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
  getch(); //getch take any value form the keyboard.
  return 0; // it will return 0 to the main function because return-type of main function is int.
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
