import java.util.Scanner;

public class WordCounter {

  
    public static void main(String[] args) {
        String sen;
        Scanner scan = new Scanner(System.in);
        System.out.print("Enter your Sentence : ");
        sen = scan.nextLine();
        System.out.print("Total Number of Words " + wordCount(sen));
    }

    public static int wordCount(String str) {
        int count = 1;
        for (int i = 0; i <= str.length() - 1; i++) {
            if (str.charAt(i) == ' ' && str.charAt(i + 1) != ' ') {
                count++;
            }
        }
        return count;
    }

}