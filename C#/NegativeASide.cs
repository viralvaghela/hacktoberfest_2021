using System;
using System.Collections.Generic;
 
public class NegativeASide
{
    static void RearrangeArr(int[] arr, int size)
    {
        int j = 0;
        for(int i=0;i<size;i++)
        {
            if(arr[i]<0)
            {
                if(i != j)
                {
                    int temp = arr[i]; 
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
                j++;
            }

        }
    }

    static void PrintArr(int[] arr)
    {
        foreach (var item in arr)
        {
            Console.Write(item+" ");
        }
        Console.WriteLine("");
    }

    public static void Main1(string[] args)
    {
        int[] arr = new int[10];
        Console.WriteLine("Enter The Value of Array");
        for (int i = 0; i < arr.Length; i++)
        {
            arr[i] = Convert.ToInt32(Console.ReadLine());
        }
        Console.WriteLine("The Value Before Rearrange array");
        PrintArr(arr);
        Console.WriteLine("The Value After Rearrange array");
        RearrangeArr(arr,arr.Length);
        PrintArr(arr);
    }
}