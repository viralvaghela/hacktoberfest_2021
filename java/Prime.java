import java.util.Scanner;

public class Prime {

    public static boolean IsPrime(int num) {
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0)
                return false;
        }
        return true;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        try {
            System.out.print("Enter number : ");
            int num = sc.nextInt();

            if (IsPrime(num))
                System.out.println(num + " is Prime.");
            else
                System.out.println(num + " is not Prime.");
        } finally {
            sc.close();
        }
    }
}