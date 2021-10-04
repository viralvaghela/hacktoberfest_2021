/// <summary>
/// This code helps to get the Reverse the array.
/// </summary>

using System;
public class ReverseArray
{
    /// <summary>
    /// Reverse array Function call1
    /// </summary>
    /// <param name="arr"></param>
    /// <param name="start"></param>
    /// <param name="end"></param>
    static void RevereseArr(int[] arr, int start, int end)
    {
        int temp;
        while (start < end)
        {
            temp = arr[start];
            arr[start] = arr[end];
            arr[end] = temp;
            start++;
            end--;
        }
    }

    /// <summary>
    /// Array printing Function Call
    /// </summary>
    /// <param name="arr"></param>
    /// <param name="size"></param>
    static void PrintArray(int[] arr, int size)
    {
        for (int i = 0; i < size; i++)
        {
            Console.Write(arr[i] + " ");
        }
        Console.WriteLine();
    }

    public static void Main1(String[] args)
    {
        int[] arr = new int[10];
        for (int i = 0; i < arr.Length; i++)
        {
            arr[i] = Convert.ToInt32(Console.ReadLine());
        }
        PrintArray(arr, arr.Length);
        RevereseArr(arr, 0, arr.Length-1);
        Console.Write("Reversed array is \n");
        PrintArray(arr, arr.Length);
    }
}