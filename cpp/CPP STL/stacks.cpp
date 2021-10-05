// works on lifo methodology

#include <iostream>
#include <stack>

using namespace std;

int main(){
    // declaration
    stack<string> st;

    // assigning value
    st.push("Adarsh");
    st.push("Navneet");
    st.push("Sinha");

    // printing our stack
    cout<<"top element is "<<st.top()<<endl;

    // size of stack
    cout<<"size of stack is "<<st.size()<<endl;

    // stack is empty or not
    cout<<"Is the stack empty?"<<st.empty()<<endl;

    // removing the top element
    st.pop();
    cout<<"Now the top is "<<st.top()<<endl;

    // printing the complete stack
    // inserting new elements
    st.push("Computer");
    st.push("Science");
    st.push("Engineering");
    int n = st.size();
    cout<<"The complete stack is ";
    for(int i=0; i<n; i++){
        cout<<st.top()<<" ";
        st.pop();
    }
    cout<<endl;

    return 0;
}