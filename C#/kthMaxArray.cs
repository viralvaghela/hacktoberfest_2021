using System;

public class kthMaxArray
{
    public static void printArray(int[] arr, int size)
    {
        // Traverse the array
        for (int i = 0; i < size; i++)
        {
            Console.Write(arr[i] + " ");
        }
    }
    public static void KthMax(int[] arr, int kth)
    {
        if (kth <= arr.Length)
        {
            Console.WriteLine("The " + kth + " Element of Array is: " + arr[kth-1]);
        }
        else
        {
            Console.WriteLine("Not Able to Find the value because you found the value out of limit");
        }

    } 
    public static void Main1()
    {
        int[] arr= new int[10];
        for(int i=0;i<arr.Length;i++){
            arr[i] = Convert.ToInt32(Console.ReadLine());
        }
        Console.WriteLine("Enter the Kth number to find");
        int kth = Convert.ToInt32(Console.ReadLine());
        Array.Sort(arr);
        KthMax(arr,kth);
        printArray(arr, arr.Length);
    }
}