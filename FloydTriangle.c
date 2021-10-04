#include <stdio.h>

int main()
{
    int r, i, j;
    int k = 1;
    printf("Enter number of rows\n");
    scanf("%d", &r);
    for (i = 1; i <= r; i++)
    {
        for (j = 1; j <= i; j++)
        {
            printf("%d ", k++);
        }
        printf("\n");
    }
    return 0;
}
