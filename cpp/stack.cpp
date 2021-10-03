#include<iostream>
#include<conio.h>
using namespace std;
class stack
{
    int s[5];
    int top;
    public:
    stack()
    {
        top=-1;
    }
       void push();
       void pop();
       void display();
};

void stack::push ()
{
    if (top!=4)
    {
        cout<<"\nenter:";
        cin>>s[++top];
    }
    else
       cout<<"\nfilled";
}

void stack::pop ()
{
    if (top!=-1)
    {
        cout<<"popped "<<s[top--];
    }
    else
       cout<<"\nempty";
}

void stack::display()
{
    if(top!=-1)
    {
        for(int i=0;i<top+1;i++)
          cout<<s[i]<<" ";
    }
    else
       cout<<"\nempty";
}


int main()
{
    stack stk;
    int ch;
    cout<<"1.push\n2.pop\n3.display\n4.exit\n";
    while(1)
    {
        cout<<"enter your choice";
        cin>>ch;
        switch(ch)
        {
            case 1:
               stk.push();break;
            case 2:
               stk.pop();break;
            case 3:
                stk.display();break;
            case 4:
                exit(1);
        }
    }
}