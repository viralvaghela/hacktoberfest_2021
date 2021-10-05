import java.util.Random;
import java.util.Scanner;
class game {
    int computer;
    int user;
    int noofguess = 0;
    Random ran = new Random();
    Scanner scan = new Scanner(System.in);

    public game() {
        computer = ran.nextInt(100);
    }

    public void user() {
        System.out.println("Enter a Number");
        user = scan.nextInt();
//        noofguess++;
    }
    public void setguess(int n){
        n=0;
        noofguess=n;

    }
    public int getguess(){
        return noofguess;
    }
    public void iscorrect() {
        while (user > 0){
            int n = 0;
            if (user > computer) {
                System.out.println("Please Choose a Smaller Number Your Value is greater than computers value");
                user = scan.nextInt();
//               setguess(n++);
                noofguess++;
            }
            else if (user < computer) {
                System.out.println("Please Choose a Greater Number your value is smaller than computers value");
                user = scan.nextInt();
//              setguess(n++);
                noofguess++;
            }
            else if (user == computer) {
                System.out.println("That's It You Won!!!");
                System.out.println("Your Value === "+user);
                System.out.println("Computer's Value === "+computer);
                break;
            }

    }
        System.out.println("No. Of Guesses ===  "+noofguess);
//        System.out.println("Guess === "+getguess());
}
}
public class Guess_The_Number{
    public static void main(String[] args) {
        game G=new game(); // game() is a constructor so it doesn't need objects to call it
        G.user();
        G.iscorrect();
        int guess= G.getguess();
        System.out.println(guess);

    }
}
