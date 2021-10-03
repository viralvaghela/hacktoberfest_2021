//Balanced Parentheses Checker 

#include<bits/stdc++.h>
using namespace std;

bool comp(char a,char b){
    return((a==')' && b=='(')
            || (a=='}'&& b=='{') 
            ||(a==']'&& b=='['));
}
class Solution
{
    public:
    //Function to check if brackets are balanced or not.
    bool ispar(string x)
    {
        stack<char> s;
        for(int i=0;i<x.length();i++)
        {
            if(x[i]=='('||x[i]=='{'||x[i]=='[')
                s.push(x[i]);
            else{
                if(s.empty()==true) return 0;
                else if(comp(x[i],s.top())==false) return 0;
                else s.pop();
            }
        }
         if(s.empty()==true) return 1;
    }

};

int main()
{
   int t;
   string a;
   cin>>t;
   while(t--)
   {
       cin>>a;
       Solution obj;
       if(obj.ispar(a))
        cout<<"balanced"<<endl;
       else
        cout<<"not balanced"<<endl;
   }
} 