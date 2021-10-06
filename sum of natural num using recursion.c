#include <stdio.h>

int sum_N_recursion (int n)
{
  // natural no. starts from 1
  if (n == 1)
    return 1;
  else
    return (n + sum_N_recursion (n - 1));
}

int main ()
{
  int n;
  printf ("Find Sum of N natural no. using recursion\n");
  printf ("Enter no.(n): ");
  scanf ("%d", &n);
  int sum = sum_N_recursion (n);
  printf ("Sum of %d natural no. is %d", n, sum);


  return 0;
