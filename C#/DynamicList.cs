using System;
using System.Collections.Generic;

public class DynamicList
{
        static void Main(string[] args)
        {
            //Create new list
            var list = new List<string>();

            //Add a few strings to list
            list.Add("This ");
            list.Add("is ");
            list.Add("a ");
            list.Add("list ");
            list.Add("of ");
            list.Add("strings ");
            list.Add("put ");
            list.Add("together! :D");

            PrintList(list);
            Console.ReadLine();
        }

        static public void PrintList(List<string> list)
        {
            foreach (var item in list)
            {
                Console.Write(item);
            }
        }
}