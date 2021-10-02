#include<bits/stdc++.h>
using namespace std;
void insert(stack<int>&st,int temp){
    if(st.size()==0||st.top()<=temp){
        st.push(temp);
        return;
    }
    int k=st.top(); st.pop();
    insert(st,temp);
    st.push(k);
    return;
}
void sort(stack<int>&st)
{
    if(st.size()==1)
     return;
     int temp=st.top();
     st.pop();
     sort(st);
     insert(st,temp);
}
int main()
{
    int n;
    cin>>n;
    stack<int> st;
    for(int i=0;i<n;i++){
        int t;
        cin>>t;
        st.push(t);
    }
    sort(st);
    while(!st.empty()){
        cout<<st.top()<<" ";
        st.pop();
    }
    return 0;
}