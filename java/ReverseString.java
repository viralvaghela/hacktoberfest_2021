import java.util.Scanner;
class Main {
    public static void main(String[] args) {    
      Scanner sc=new Scanner(System.in);
      System.out.println("Enter the string:");
      String str=sc.nextLine();
     
        String revStr = "";    
            
        //Iterate through the string from last and add each character to variable reversedStr    
        for(int i = str.length()-1; i >= 0; i--){    
            revStr = revStr + str.charAt(i);    
        }    
            
        System.out.println("Entered string: " + str);    
        //Displays the reverse of given string    
        System.out.println("Reversed string: " + revStr);    
    }    
}    