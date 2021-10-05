// Implemented using BST
// Modification of elements is allowed

#include <iostream>
#include <unordered_set>

using namespace std;

int main()
{
    // declaration
    unordered_set<int> ust;

    // inserting elements takes O(1) time
    ust.insert(1);
    ust.insert(7);
    ust.insert(8);
    ust.insert(2);
    ust.insert(5);

    // printing the set
    unordered_set<int> :: iterator itr;
    for (itr = ust.begin(); itr != ust.end(); itr++)
    {
        cout << *itr << " ";
    }
    cout << endl;

    // finding any elements require O(1)
    // "find" function returns the iterator in O(1)
    cout << "Print 5 if present ";
    cout << *ust.find(5) << endl;
    // "count" function returns bool value in O(1) time
    cout << "Is 9 present in the set? " << ust.count(9) << endl;

    // deleting all elements in the set
    cout << "Is the set empty? " << ust.empty() << endl;
    ust.clear();
    cout << "Is the set empty now? " << ust.empty() << endl;

    return 0;
}