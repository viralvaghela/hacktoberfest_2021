// It works on the FIFO methodology

#include <iostream>
#include <queue>

using namespace std;

int main(){
    // declaration
    queue<int> q;

    // assigning values 
    q.push(1);
    q.push(2);
    q.push(3);
    q.push(4);
    q.push(5);

    // size of queue
    cout<<"The size of queue is "<<q.size()<<endl;

    // empty or not
    cout<<"Is the queue empty? "<<q.empty()<<endl;

    // printing the first element
    cout<<"The first element is "<<q.front()<<endl;

    // deleting the first element
    q.pop();
    cout<<"Now after deleting prev first, the first element is "<<q. front()<<endl;

    // printing the entire queue
    cout<<"Printing the entire queue : ";
    int n = q.size();
    for(int i=0; i<n; i++){
        cout<<q.front()<<" ";
        q.pop();
    }
    cout<<endl;


    return 0;
}