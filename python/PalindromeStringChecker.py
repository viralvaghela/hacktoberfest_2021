#Program to check if given string is palindrome or not.

string=input(("Enter your string:"))  
if(string==string[::-1]):  
      print("The string is a palindrome")  
else:  
      print("The string is not a palindrome")