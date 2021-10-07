// deque is also know as doubly ended queue

#include <iostream>
#include <deque>

using namespace std;

int main()
{
    // declaration
    deque<int> dq;

    // assigning value
    // we can enter value in doubly ended queue both from front and back
    dq.push_back(1);
    dq.push_back(2);
    dq.push_back(3);
    dq.push_back(4);
    dq.push_back(5);
    dq.push_front(0);

    // printing the deque
    for (auto i : dq)
        cout << i << " ";
    cout << endl<<endl;

    // excessing the ith element from a deque
    cout << dq[1] << " " << dq.at(1) << endl<<endl;

    // removing elements from deque
    // we can remove the elements both from front and back
    dq.pop_back();
    dq.pop_front();
    // checking our functions
    for (auto i : dq)
        cout << i << " ";
    cout << endl<<endl;

    // front and back elements
    cout<<"Front and back elements are ";
    cout << dq.front() << " and " << dq.back() << endl<<endl;

    // to check if our deques is empty or not;
    cout << "Is the deque empty? " << dq.empty() << endl<<endl;

    // first and last+1 iterators
    cout <<"First and last element using pointers"<<endl<<*dq.begin() << " " << *(dq.end() - 1) << endl<<endl;

    // size of the deque
    cout<<"The size of deque is "<<dq.size()<<endl<<endl; 

    // deleting all elements of deque or selection of elements
    dq.erase(dq.begin()+2,dq.end());
    cout<<"After deleting all elements except the first 2"<<endl;
    cout<<"The size of deque is "<<dq.size()<<endl; 
    cout << "Is the deque empty? " << dq.empty() << endl<<endl;
    dq.erase(dq.begin(),dq.end());
    cout<<"\nAfter deleting all elements"<<endl;
    cout<<"The size of deque is "<<dq.size()<<endl; 
    cout << "Is the deque empty? " << dq.empty() << endl;

    return 0;
}