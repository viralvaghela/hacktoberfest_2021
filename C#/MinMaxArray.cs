using System;
public class MinMaxArray
{
    static void MinMax(int[] arr,int size)
    {
        int min,max = 0;
        if(size==1)
        {
            min=max=arr[0];
        }
        if(arr[0]>arr[1])
        {
            min = arr[1];
            max = arr[0];
        }else
        {
            min = arr[0];
            max = arr[1];
        }
        for(int i=2;i<size;i++)
        {
            if(arr[i]>max)
            {
                max = arr[i];
            }else if(arr[i]<min)
            {
                min = arr[i];
            }
        }
        Console.WriteLine("Maximum Number is: "+max);
        Console.WriteLine("Minimum Number is: "+min);
    }
    public static void Main1(String[] args)
    {
        int[] arr = new int[10];
        for (int i = 0; i < arr.Length; i++)
        {
            arr[i] = Convert.ToInt32(Console.ReadLine());
        }
        MinMax(arr, arr.Length);
    }
}