#include <iostream>
#include <list>

using namespace std;

int main()
{
    // declaration
    list<int> ls;

    // assigning values
    ls.push_back(1);
    ls.push_back(3);
    ls.push_back(2);
    ls.push_back(4);
    ls.push_front(0);
    // printing a list
    for (auto i : ls)
        cout << i << " ";
    cout << endl;

    // declaration with given dingle value
    list<int> l(5, 10);
    cout << "this list will print like this ";
    for (auto i : l)
        cout << i << " ";
    cout << endl;

    // deleting the first element
    ls.erase(ls.begin());
    cout << "After deleting first element  : ";
    for (auto i : ls)
        cout << i << " ";
    cout << endl;

    // deleting the first or the last element
    ls.pop_back();
    ls.pop_front();
    cout << "After deleting front and back element  : ";
    for (auto i : ls)
        cout << i << " ";
    cout << endl;

    // size of the list
    cout << "The size of the list is " << ls.size() << endl;

    // iterators
    cout << "front and back iterators are " << *ls.begin() << " ls.end()" << endl;

    return 0;
}