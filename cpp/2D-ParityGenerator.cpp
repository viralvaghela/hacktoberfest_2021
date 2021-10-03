#include <iostream>
using namespace std;

int main()
{
    bool type;
    cout<<"Enter 0 for even parity check and 1 for odd parity check:";
    cin>>type;
    int l;
    int n;
    cout<<"Enter message length:";
    cin>>l;
    cout<<"Enter number of messages:";
    cin>>n;
    int msg[n+1][l+1];
    for(int i=0;i<n;i++)
    {
        cout<<"Enter Message "<<i+1<<":";
        int num;
        cin>>num;
        int c=0;
        for(int j=l-1;j>=0;j--)
        {
            msg[i][j]=num%10;
            num/=10;
            if(msg[i][j])
                c++;
        }
        if((type && c%2==0)||(!type && c%2==1))
            msg[i][l]=1;
        else
            msg[i][l]=0;
    }
    for(int j=0;j<=l;j++)
    {
        int c=0;
        for(int i=0;i<n;i++)
        {
           if(msg[i][j])
                c++;
        }
        if((type && c%2==0)||(!type && c%2==1))
            msg[n][j]=1;
        else
            msg[n][j]=0;
    }
    cout<<"Data to be sent:\n";
    for(int i=0;i<=n;i++)
    {
        for(int j=0;j<=l;j++)
            cout<<msg[i][j];
        cout<<endl;
    }
    cout<<"Enter Received Data:\n";
    int res[n+1][l+1];
    int f=0;
    for(int i=0;i<=n;i++)
    {
        int num;
        cin>>num;
        for(int j=l;j>=0;j--)
        {
            res[i][j]=num%10;
            num/=10;
        }
    }
    for(int i=0;i<=n;i++)
    {
        int c=0;
        for(int j=0;j<=l;j++)
            if(res[i][j])
                c++;
        if(type^(c%2==1))
        {
            cout<<"Error in Row:"<<i+1;
            f=1;
        }
    }
    for(int i=0;i<=l;i++)
    {
        int c=0;
        for(int j=0;j<=n;j++)
            if(res[j][i])
                c++;
        if(type^(c%2==1))
        {
            cout<<"\nError in Column:"<<i+1;
            f=1;
        }
    }
    if (f==0)
        cout<<"No Error in Received Data.";
    return 0;
}
