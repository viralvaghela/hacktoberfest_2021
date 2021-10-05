// it works on max heap and min heap
// i.e. it stores values in sorted order either increasing or decreasing

#include <iostream>
#include <queue>

using namespace std;

int main()
{
    // decreasing order implementation
    priority_queue<int> maxi;

    // increasing order implementaion
    priority_queue<int, vector<int>, greater<int>> mini;

    // putting the same values in both the queues
    // pushing values to maxi(max heap)
    maxi.push(5);
    maxi.push(7);
    maxi.push(1);
    maxi.push(2);
    maxi.push(9);
    // pushing value to mini
    mini.push(5);
    mini.push(7);
    mini.push(1);
    mini.push(2);
    mini.push(9);

    // empty function
    cout << "Is maxi empty? " << maxi.empty() << endl;

    // size fuction
    cout << "The size of maxi is " << maxi.size() << endl;
    cout << "The size of mini is " << mini.size() << endl;

    // printing the maxi(max heap)
    cout << "Printing the maxi ";
    int n = maxi.size();
    for (int i = 0; i < n; i++)
    {
        cout << maxi.top() << " ";
        maxi.pop();
    }
    cout << endl;
    cout << "Is maxi empty now? " << mini.empty() << endl;

    // printing the mini(min heap)
    cout << "Printing the mini ";
    n = mini.size();
    for (int i = 0; i < n; i++)
    {
        cout << mini.top() << " ";
        mini.pop();
    }

    return 0;
}