#include <stdio.h>
#include <iostream>
#include <string.h>
#include <vector>
using namespace std;
// Creating a class for simplicity in finding maximum and minimum
class Dnc
{
public:
    // Declaration of class variables
    int n, max, min;
    int arr[10];
    // Member function for getting all the elements
    void get()
    {
        cout << "Enter the number of elements in Array : " << endl;
        cin >> n;
        cout << "Enter the elements" << endl;
        for (int i = 0; i < n; i++)
        {
            cin >> arr[i];
        }
    }
    // Member function for finding min and max
    Dnc MinMaxDnC(int low, int high)
    {
        Dnc t;
        // If there is only one element
        if (low == high)
        {
            t.max = arr[low];
            t.min = arr[low];
            return t;
        }
        // If there are two elements
        if (high == low + 1)
        {
            if (arr[low] > arr[high])
            {
                t.max = arr[low];
                t.min = arr[high];
            }
            else
            {
                t.max = arr[high];
                t.min = arr[low];
            }
            return t;
        }
        int mid;
        mid = (low + high) / 2;
        Dnc mml = MinMaxDnC(low, mid);
        Dnc mmr = MinMaxDnC(mid + 1, high);
        // Compare minimums of two parts
        if (mml.min < mmr.min)
            t.min = mml.min;
        else
            t.min = mmr.min;
        // Compare maximums of two parts
        if (mml.max > mmr.max)
            t.max = mml.max;
        else
            t.max = mmr.max;
        return t;
    }
};
// Driver code
int main()
{
    Dnc f;
    f.get();
    cout << "The max element is " << f.MinMaxDnC(0, f.n - 1).max << endl;
    cout << "The min element is " << f.MinMaxDnC(0, f.n - 1).min << endl;
    return 1;
}
