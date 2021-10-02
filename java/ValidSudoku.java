import static java.lang.String.*;

public class ValidSudoku {


        static boolean isValidSudoku(String board[][])
        {

            boolean[][] row = new boolean[9][9];
            boolean[][] col = new boolean[9][9];
            boolean[][] box = new boolean[9][9];


            for(int i = 0; i < 9; i++)
            {

                for(int j = 0; j < 9; j++)
                {
                    if (!board[i][j].equals("."))
                    {
                       int n= Integer.parseInt(board[i][j])-1;
                       int k=i/3*3+j/3;
                       if(row[i][n]|| col[j][n]||box[k][n]){
                           return false;
                       }row[i][n]=col[j][n]=box[k][n]=true;
                    }
                }
            }
return true;

        }

        // Driver Code
        public static void main(String[] args)
        {
            String[][] board = { { "5","3",".",".","7",".",".",".","."}
,{"6",".",".","1","9","5",".",".","."}
,{".","9","8",".",".",".",".","6","."}
,{"8",".",".",".","6",".",".",".","3"}
,{"4",".",".","8",".","3",".",".","1"}
,{"7",".",".",".","2",".",".",".","6"}
,{".","6",".",".",".",".","2","8","."}
,{".",".",".","4","1","9",".",".","5"}
,{".",".",".",".","8",".",".","7","9"}};

            if (isValidSudoku(board))
            {
                System.out.println("Valid");
            }
            else
            {
                System.out.println("Not Valid");
            }
        }

}
