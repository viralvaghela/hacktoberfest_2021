//implementation of queue using arrays

#include<iostream>
using namespace std;
int enqueue();
int dequeue();
void display();
int q[100],n,f=-1,r=-1;
int main()
{
    int ch;
	cout<<"Enter the size of queue"<<endl;
cin>>n;
    while(1)

    {
        cout<<"Enter 1.Enqueue 2.Dequeue 3.Display 4.Exit "<<endl;
        cin>>ch;
        switch (ch)
        {
            case 1 : enqueue();break;
            case 2 : dequeue();break;
            case 3 : display();break;
            case 4 : exit(0);
            default : cout<<"enter correct choice "<<endl;
        }
    }
    return 0;
}

int enqueue()
{  int s;
    if(f==0&&r==n-1)
    {
        cout<<"Queue is full "<<endl;
        return 0;
    }
    cout<<"enter the number : ";
    cin>>s;
    if(f==-1 && r==-1)
    {
        f=0;r=0;
    }
    else if (f!=0 && r==n-1)
    {
        r=0;
    }
    else 
    {
        r=r+1;
    }
    q[r]=s;
}

int dequeue()
{
    if(f==-1)
    {
        cout<<"Queue is empty "<<endl;
        return 0;
    }
    if(f==r)
    {
        f=-1;r=-1;
    }
    else if(f==n-1)
    {
        f=0;
    }
    else
    f=f+1;
cout<<"First element removed "<<endl;
}

void display()
{
    int i;
cout<<"Queue is : "<<endl;
    if(f<=r)
    {
        for(i=f;i<=r;i++)
         cout<<q[i]<<" ";
    }
    else{
        for(i=f;i<n;i++)
        cout<<q[i]<<" ";

        for(i=0;i<=r;i++)
        cout<<q[i]<<" ";
    }
    cout<<endl;
}
