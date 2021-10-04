class SelectionSort{
	public static void printArray(int a[]){
		System.out.println("Array: ");
		for(int i=0; i<a.length; i++){
			System.out.print(a[i]+" ");
		}
			System.out.println("\n");		
	}

	public static void sort(int[] arr){
		int size=arr.length;
		int temp=0;

		for(int i=0; i<size-1; i++){
			int mindex=i;
			for(int x=i+1; x<size; x++){
				if(arr[x]<arr[mindex])
					mindex=x;				
			}

			temp=arr[mindex];
			arr[mindex]=arr[i];
			arr[i]=temp;

		}

	}

	public static void main(String args[]){
		int[] arr={28,41,53,4,99,15};
		printArray(arr);
		sort(arr);
		printArray(arr);
	}
}