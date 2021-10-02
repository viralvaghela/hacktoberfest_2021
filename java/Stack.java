class Stack
{
	int a[] = new int[5];
	int top = 0;



	public void push(int data)
	{
		
		if(top == a.length)
		{
			int b[] = new int[2*a.length];
			for(int i = 0; i < a.length; i++)
			{
				b[i] = a[i];
			}
			a = b;

		}

		a[top++] = data;
	}

	public int pop()
	{
		if(isEmpty())
		{
			System.out.println("Stack is Empty");
			return 0;
		}

		else
		{
			int data;
			top--;
			data = a[top];
			a[top]=0;
			return data;
		}
	}

	public boolean isEmpty()
	{
		return top==0;
			
	}	
		
	

	public int peek()
	{
		if(isEmpty())
		{
			System.out.println("Stack is Empty");
			return 0;
		}

		else
		{
		int data;
		
		data = a[top-1];
		return data;
    	}
	}

	public int size()
	{
		return top;
	}

	public void print()
	{
		System.out.print("[");
		for(int i = 0;i < top;i++)
		{
            if(i == top-1)
			    System.out.print(a[i]);

            else
                System.out.print(a[i] + ", ");
		}

		System.out.println("]");
	}

    public static void main(String[]args)
	{
		Stack s1 = new Stack();

		

		s1.push(10);
		s1.push(2);
		s1.push(5);
		s1.push(7);
		s1.push(15);
		s1.push(20);

        s1.print();

		s1.pop();
		s1.pop();
		s1.pop();
		
        s1.print();

		System.out.println("Peek = " + s1.peek());
		System.out.println("Size = " + s1.size());
        
	}
}