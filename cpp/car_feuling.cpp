#include<iostream>
#include<string.h>
#include<bits/stdc++.h>

using std::cin;
using std::cout;
using std::vector;
using std::max;

int compute_min_refills(int dist, int tank, vector<int> & stops,int n) {
    int start=0;
    int refill=0;
    int total_ref=0;
    stops.push_back(dist);
    for(int i=0;i<n;i++)
    {

        if(refill==0)
        {

            if (stops[i+1]>tank)
            {
                if (stops[i]>tank||(stops[i+1]-stops[i]>tank))
                    return -1;
                else
                {
                    cout<<"stop = "<<stops[i]<<"\n";
                    cout<<"i = "<<i<<"\n";
                    total_ref++;
                    refill=i;
                    cout<<"refill = "<<refill<<"\n";
                }
            }
        }
        else
        {
            if (stops[i+1]-stops[refill]>tank)
            {
                cout<<"yes"<<"\n";
                if ((refill==i)||(stops[i+1]-stops[i]>tank))
                    return -1;
                else
                {
                    cout<<"stop = "<<stops[i]<<"\n";
                    cout<<"i = "<<i<<"\n";
                    total_ref++;
                    refill=i;
                    cout<<"refill = "<<refill<<"\n";
                }
            }
        }
    }
    return total_ref;
}


int main() {
    int d = 0;
    cin >> d;
    int m = 0;
    cin >> m;
    int n = 0;
    cin >> n;

    vector<int> stops(n);
    for (size_t i = 0; i < n; ++i)
        cin >> stops.at(i);

    cout << compute_min_refills(d, m, stops,n) << "\n";

    return 0;
}
