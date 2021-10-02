// Binary Search java code

public class BinarySearch
{
	public static void main(String[] args) {
		int arr[] = {3, 6, 7, 11, 20, 28, 35, 100};
		int x = 28;
		int position = binarySearch(arr, x);
		if(position == -1)
		    System.out.println(x + " is not present in the given array");
		else
		    System.out.println(x + " is present at " + position + " in the given array");
	}
	
	// searching a number in a given sorted array
	static int binarySearch(int[] arr, int x)
    {
        int l = 0, r = arr.length-1;
        
        while (l <= r) {
            int mid = l + (r-l)/2;
  
            if (arr[mid] == x)     // if x is present at mid
                return mid;
  
            if (arr[mid] < x)      // if x greater, ignore left half
                l = mid + 1;
            else                 // if x is smaller, ignore right half
                r = mid - 1;
        }
        return -1;               // if x is not present in array
    }
}
