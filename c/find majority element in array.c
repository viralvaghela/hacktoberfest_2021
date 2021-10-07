#include<stdio.h>

void findMajority(int arr[], int n)
{
	int maxCount = 0;
	int index = -1; 
	for (int i = 0; i < n; i++) {
		int count = 0;
		for (int j = 0; j < n; j++) {
			if (arr[i] == arr[j])
				count++;
		}
		if (count > maxCount) {
			maxCount = count;
			index = i;
		}
	}
	if (maxCount > (n / 2))
		printf("Majority element is %d\n",arr[index]);

	else
	    printf("No Majority Element\n");
    
}

int main()
{
	int n;
	printf("Enter arr size: ");
	scanf("%d",&n);
	int arr[n];
	 for(int i=0;i<n;i++){
	     scanf("%d ",&arr[i]);
	 }

	// Function call
	findMajority(arr, n);

	return 0;
}
