// To count Set bits in an integer
#include <bits/stdc++.h>
using namespace std;

class Solution {
  public:
    int setBits(int n) {
        int count=0;
        while(n!=0)
        {
            n=n&(n-1);  
            count++;
        }
        return count;
    }
};
int main() {
    int t;
    cin >> t;
    while (t--) {
        int N;
        cin >> N;

        Solution ob;
        int cnt = ob.setBits(N);
        cout << cnt << endl;
    }
    return 0;
}