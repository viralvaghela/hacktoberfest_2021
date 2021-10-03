using System;

public class RotateArr
{
    static public void RotateArrByOne(int[] arr)
    {
        int temp = arr[0];
        for(int i=0;i<arr.Length;i++)
        {
            if(i==arr.Length-1)
            {
                arr[i]=temp;
            }else
            {
                arr[i]=arr[i+1];
            }
        }
    }

    static public void PrintArr(int[] arr)
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
        Console.WriteLine("Enter The Values Of Arr");
        for(int i=0;i<arr.Length;i++)
        {
            arr[i] = Convert.ToInt32(Console.ReadLine());
        }
        Console.WriteLine("The Values Of Arr Are");
        PrintArr(arr);
        Console.WriteLine("Values after Rotation");
        RotateArrByOne(arr);
        PrintArr(arr);
    }
}