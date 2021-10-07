#include<iostream>
using namespace std;
class B;
class A
{
	private:
	int num1;
	public:
	void getData()
	{
		cout<<"Before swapping: \n";
		cout<<"Enter the first number:";
		cin>>num1;
	}
	void show()
	{
		cout<<"Number in class A: "<<num1<<endl;
	}
	friend void Swap(A*num1, B*num2);
};
class B
{
	int num2;
public:
	void getData()
	{
		cout<<"Enter the second number: ";
		cin>>num2;
	}
	void show()
	{
		cout<<"Number in class B: "<<num2<<endl;
	}
	friend void Swap(A*num1, B*num2);
};
void Swap(A*a1, B*b1)
{
	int num3;
	num3 = a1 -> num1;
	a1 -> num1 = b1 -> num2;
	b1 -> num2 = num3;
	cout<<"After Swapping: \n";
}
int main()
{
	A a;
	B b;
	a.getData();
	b.getData();
	Swap(&a, &b);
	a.show();
	b.show();
	return 0;
}

