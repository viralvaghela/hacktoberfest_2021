#include <iostream>
using namespace std;

void heap(int arr[], int n, int i)
{
    int large = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;
 
    if (l < n && arr[l] > arr[large])
        large = l;
 
    if (r < n && arr[r] > arr[large])
        large = r;
 
    if (large != i) {
        swap(arr[i], arr[large]);
        heap(arr, n, large);
    }
}
 
void sort(int arr[], int l)
{
    for (int i = l / 2 - 1; i >= 0; i--)
        heap(arr, l, i);
 
    for (int i = l - 1; i > 0; i--) {
        swap(arr[0], arr[i]);
        heap(arr, i, 0);
    }
}
 
int main()
{
    int n;
    cout << "Enter number of elements: ";
    cin >> n;
    int arr[n];
    cout << "Enter array elements: ";
    for(int i =0; i<n; i++)
        cin >> arr[i];
    sort(arr, n);
    cout << "Sorted array is \n";
    for (int i = 0; i < n; ++i)
        cout << arr[i] << " ";
}