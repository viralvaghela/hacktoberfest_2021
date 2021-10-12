/* Spiral Print of array */

import java.util.Scanner;

public class Spiral {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    System.out.println("Enter size: ");
    int n = sc.nextInt();
    int[][] ar = new int[n][n];
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        ar[i][j] = sc.nextInt();
      }
    }
    sc.close();
    printSpiral(ar);
  }

  static void printSpiral(int[][] ar) {
    int left = 0, top = 0, bottom = ar.length - 1, right = ar[0].length - 1;
    int count = (bottom + 1) * (right + 1), dir = 1;

    while (left <= right && top <= bottom && count > 0) {
      if (dir == 1) {
        for (int i = left; i <= right; i++) {
          System.out.println(ar[top][i]);
          count--;
        }
        top++;
        dir = 2;
      }
      if (dir == 2) {
        for (int i = top; i <= bottom; i++) {
          System.out.println(ar[i][right]);
          count--;
        }
        right--;
        dir = 3;
      }
      if (dir == 3) {
        for (int i = right; i >= left; i--) {
          System.out.println(ar[bottom][i]);
          count--;
        }
        bottom--;
        dir = 4;
      }
      if (dir == 4) {
        for (int i = bottom; i >= top; i--) {
          System.out.println(ar[i][left]);
          count--;
        }
        left++;
        dir = 1;
      }
    }

  }
}
