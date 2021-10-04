#include<iostream>
#include<string>
using namespace std;

int main()
{
    string s;
    cout<<"Enter String: ";
    getline(cin,s);
    string a="";
    for(int i=0;i<s.length();++i)
    {
        int c=0;
        a=a+s.at(i);
        for(int j=i;j<s.length()-1;++j)
        {
            if(s.at(j)==s.at(j+1))
            {
                ++c;
                continue;
            }
            else
            break;
        }
        i=i+c;
    }    
    cout<<"Output : "<<a;
}