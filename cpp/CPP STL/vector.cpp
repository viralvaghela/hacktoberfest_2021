#include <iostream>
#include <vector>
using namespace std;

int main()
{
    // declaration
    vector<int> v;

    // assigning values
    for (int i = 0; i < 5; i++)
    {
        int temp;
        cin >> temp;
        // adding the input to our vector
        v.push_back(temp);
    }

    // printing the vector
    for (auto i : v)
        cout << i << " ";
    cout << endl;

    // with same given values
    vector<int> a(5, 1);
    // checking our vector
    for (auto i : a)
        cout << i << " ";
    cout << endl;

    // coping one vector in different one
    vector<int> last(a);
    // checking our vector
    for (auto i : last)
        cout << i << " ";
    cout << endl;

    // size of the vector
    cout << v.size() << endl;

    // capacity of the vector
    // how much place in vector is currently empty(not filled)
    cout << v.capacity() << endl;

    // excessing certain element at any index
    cout << v[1] << " " << v.at(1) << endl;

    // rempving the last element from the vector
    v.pop_back();
    // checking our fuction
    for (auto i : v)
        cout << i << " ";
    cout << endl;

    // front and back elements
    cout << v.front() << " " << v.back() << endl;

    // iterators(pointers for first and last+1 element)
    cout << *v.begin() << " " << *(v.end() - 1) << endl;

    // deleting all elements of vector
    v.clear();
    // size changes to 0 but the capacity remains the same
    cout << "SIZE : " << v.size() << endl
         << "CAPACITY : " << v.capacity() << endl;

    // to check if our vector is empty or not
    cout << "Is the vector-a empty? " << a.empty() << endl;
    cout << "Is the vector-v empty? " << v.empty() << endl;

    return 0;
}