#include <iostream>
#include<stack>
using namespace std;

bool is_balanced(char a[], stack<char> s){
	for(int i=0; a[i]!='\0';i++){
		char c = a[i];
		if(c=='(' || c=='{' || c=='['){
			s.push(c);
		}
		else{
			if(s.empty()) // )[]{}
				return false;
			
			if(c==')'){
               if(s.top()=='('){
               	s.pop();
               }
               else
               	return false;
			}
			else if(c=='}'){
				
               if(s.top()=='{'){
               	s.pop();
               }
               else
               	return false;
			

			}
			else{
				
               if(s.top()=='['){
               	s.pop();
               }
               else
               	return false;
			}

			
		}
	}
	if(s.empty())
		return true;
	else
		return false;
}

int main()
{
	char a[1000];
	cin >> a;
	stack<char> s;
	cout << boolalpha << is_balanced(a, s);

	return 0;
}