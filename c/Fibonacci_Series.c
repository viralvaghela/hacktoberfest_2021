#include <stdio.h>
int main()
{
	 int n,a=0,b=1,nt;
	 printf("Enter number of terms for Fibonacci Series:");
	 scanf("%d",&n);
	 printf("The Fibonacci Series:");
	 for(int i=1;i<=n;++i)
	 {
		printf("%d, ",a);
		nt=a+b;
		a=b;
		b=nt;
	 }
	 return 0;
}
