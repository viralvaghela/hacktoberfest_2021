#include <iostream>
using namespace std;

int main() {
	//to check for leap year
	int year;
	cout<<"Enter year to check if it is leap year or not: "<<endl;
	cin>>year;
	if(year%4==0){
		if(year%400==0 && year%100==0){
			cout<<"It is a Leap year"<<endl;
		}
		else if((year%100)!=0){
			cout<<"It is a Leap year"<<endl;

		}
		else{
			cout<<"Not a Leap year"<<endl;
		}

	}
	else{
		cout<<"Not a Leap year"<<endl;
	}
	return 0;
}
