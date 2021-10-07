 long long minCost(long long arr[], long long n) {
        // Your code here
        long long res=0;
        
        priority_queue<long long, vector<long long>,greater<long long> > minh;
        long long first, second;
        
        for(int i=0; i<n; i++)
        {
            minh.push(arr[i]); 
        }
        
        while(minh.size()>=2)
        {
            first=minh.top();
            minh.pop();
            
            second=minh.top();
            minh.pop();
            
            res= res+first+second;
            
            minh.push(first+second);
            
        }
        
        
        return res;
    }
