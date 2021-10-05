// In set, only unique elements are stored
// Implemented using BST
// Modification of elements is allowed
// Stores element in sorted order

#include <iostream>
#include <set>

using namespace std;

int main()
{
    // declaration
    set<int> s;

    // inserting elements takes O(log n) time
    s.insert(1);
    s.insert(7);
    s.insert(8);
    s.insert(2);
    s.insert(5);

    // printing the set
    set<int, greater<int>>::iterator itr;
    for (itr = s.begin(); itr != s.end(); itr++)
    {
        cout << *itr << " ";
    }
    cout << endl;

    // finding any elements require O(log n)
    // "find" function returns the iterator in O(log n)
    cout << "Print 5 if present ";
    cout << *s.find(5) << endl;
    // "count" function returns bool value in O(log n) time
    cout << "Is 9 present in the set? " << s.count(9) << endl;

    // deleting all elements in the set
    cout << "Is the set empty? " << s.empty() << endl;
    s.clear();
    cout << "Is the set empty now? " << s.empty() << endl;

    return 0;
}