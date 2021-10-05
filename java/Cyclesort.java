import java.util.Scanner;

public class Cyclesort
{
    static void sort(int a[], int n)
    {
        int writes = 0,start,element,pos,temp,i;

        for (start = 0; start <= n - 2; start++) {
            element = a[start];
            pos = start;
            for (i = start + 1; i < n; i++)
                if (a[i] < element)
                    pos++;
            if (pos == start)
                continue;
            while (element == a[pos])
                pos += 1;
            if (pos != start) {
                //swap(element, a[pos]);
                temp = element;
                element = a[pos];
                a[pos] = temp;
                writes++;
            }
            while (pos != start) {
                pos = start;
                for (i = start + 1; i < n; i++)
                    if (a[i] < element)
                        pos += 1;
                while (element == a[pos])
                    pos += 1;
                if (element != a[pos]) {
                    temp = element;
                    element = a[pos];
                    a[pos] = temp;
                    writes++;
                }
            }
        }
    }
    public static void main(String[] args)
    {
        int arr[] = new int[5];
        Scanner in = new Scanner(System.in);
        System.out.println("enter no of elements you want to sort");
        int n = in.nextInt();
        System.out.println("Enter numbers of the array");
        for(int i =0;i<n;i++)
        {
            arr[i] = in.nextInt();
        }
        sort(arr, n);
        System.out.println("After sort, array : ");
        for (int i = 0; i < n; i++)
            System.out.println(arr[i]);

    }
}
