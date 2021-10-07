// Linear Search CPP

#include<iostream>
using namespace std;


int main() {
	int n , x;
	cin >> n >> x;
	int arr[n];
	for(int i = 0 ; i < n ; i++)
		cin >> arr[i];
	for(int i = 0 ; i < n ; i++)
	{
		if(arr[i] == x)
		{
			cout<<"Found at"<<" "<< i <<endl;
			return 0;
		}
	}
	cout<<"Not Found"<<endl;
	return 0;
}


/*
  INPUT - 
  5 2
  1 2 3 4 5
  
  OUTPUT - 
  FOUND at 1

*/
