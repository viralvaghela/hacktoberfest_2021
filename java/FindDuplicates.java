import java.io.CharConversionException;
import java.util.ArrayList;

public class FindDuplicates {

    public static void main(String[] args) {
        String inputString = "My name is Guarav Kukade!";

        printDuplicates(inputString);
    }

    public static void printDuplicates(String inputString) {
        // count
        int count = 0;

        // a temp list of ch for which we have already printed the count
        ArrayList<Character> charList = new ArrayList<>();

        for (int i = 0; i < inputString.length(); i++) {

            char ch = inputString.charAt(i);

            // count the number of occurrences of the char ch in inputString
            for (int j = 0; j < inputString.length(); j++) {
                if (inputString.charAt(j) != ch) {
                    continue;
                }
                count++;

            }

            // check if we have already printed for ch
            if (!charList.contains(ch)) {
                // check if count is more than 1 i.e. duplicate and char should not be space
                if (count > 1 && ch != ' ') {

                    System.out.println("Char: " + ch + ", Count: " + count + " times.");
                    charList.add(ch);
                }
            }

            // set counter to zero for next ch
            count = 0;
        }
    }

}
