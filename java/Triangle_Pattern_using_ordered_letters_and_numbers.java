import java.util.Scanner;
class Triangle_Pattern_using_ordered_letters_and_numbers{
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
        System.out.println("Enter the number of Rows for Pattern: ");
		int i,j,k,n,asci;
		n = sc.nextInt();
		int countSpace=n-1;	
		for(i=1;i<=n;i++) {
			for(j=0;j<countSpace;j++) {
				System.out.print(" ");
			}
			countSpace--;
			if(i%3==0) {
				for(k=1;k<=i;k++)
					System.out.print(k);
				for(k=i-1;k>0;k--)
					System.out.print(k);	
			}
			else {
				if(i%3==0) 
					asci = 96;
				else
					asci = 64;
				for(k=1;k<=i;k++)
					System.out.print((char)(k+asci));
				for(k=i-1;k>0;k--)
					System.out.print((char)(k+asci));	
			}
			System.out.println();
			
		}
		
	}
}
/*
Output:
Enter the number of Rows for Pattern: 7
      A
     ABA
    12321
   ABCDCBA
  ABCDEDCBA
 12345654321
ABCDEFGFEDCBA
*/
