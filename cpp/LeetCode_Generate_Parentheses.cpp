#include<bits/stdc++.h>
using namespace std;
// void online()  //to compile codes using online judge
// {
//     #ifndef ONLINE_JUDGE
//     freopen("input.txt", "r", stdin);
//     freopen("output.txt", "w", stdout);
//     #endif
// }
void solve(int n,string op,vector<string> &sol,int open,int close){
     if(open==n && close==n){  //base condition when total no. of open and closed Parentheses are used 
        sol.push_back(op);
        return;
    } 
    if(open<n){
         string op1=op;
        op1+='(';
        solve(n,op1,sol,open+1,close);
    }
    if(close<open){
        string op2=op;
        op2+=')';
         solve(n,op2,sol,open,close+1); 
    } 
}
int main(){
    //online();
    int n;
    cin>>n;
    vector<string> sol; // to save the solution in vector of strings
    solve(n,"",sol,0,0);
    for(auto a:sol){
        cout<<a<<endl;
    }
    return 0;
}