#include <bits/stdc++.h>
#include <ctime>

using namespace std;

// matrix chain multiplication to print number of multiplications required
int MatrixChainMultiplication(int p[], int i, int j)
{
    if (i == j)
        return 0;
    int k;
    int min = INT_MAX;
    int count;
    /* place parenthesis at different places between first and last matrix, 
    recursively calculate count of multiplications for each parenthesis placement 
    and return the minimum count */
    for (k = i; k < j; k++)
    {
        count = MatrixChainMultiplication(p, i, k) +
                MatrixChainMultiplication(p, k + 1, j) +
                p[i - 1] * p[k] * p[j];
        if (count < min)
            min = count;
    }
    // Return minimum count
    return min;
}
// main function
int main()
{
    // taking input for number of matrices
    int n;
    cout << "Enter number of matrices : ";
    cin >> n;
    // taking input for dimensions
    int dimension[n];
    cout<<"Enter the dimensions of matrix : "<<endl;
    for (int i = 0; i <= n; i++)
    {
        cin >> dimension[i];
    }
    // printing number of multiplications required
    double time_spent = 0.0;
    clock_t begin = clock();
    cout << "Minimum multiplications required : " << MatrixChainMultiplication(dimension, 1, n);
    clock_t end = clock();
    time_spent += (double)(end - begin) / CLOCKS_PER_SEC;
    cout<<endl;
    printf("The elapsed time is %f seconds", time_spent);
}