public class Patterns {

	public static void main(String[] args) {
		
   	rhombuspattern(5);
    
}
  
  
  static void rhombuspattern(int n) {
	
//	    *
//     * *
//    * * *
//   * * * *
//  * * * * *
//   * * * *
//    * * *
//     * *
//      *
	
		for (int row = 1; row <2*n; row++) {
		
			int uptowhatCol = row > n ? 2*n-row : row ;
			
			int howmuchSpace = n-uptowhatCol;
			
			for(int space=1;space<= howmuchSpace ; space++) {
				System.out.print(" ");
			}
			
			for (int col = 1; col <= uptowhatCol; col++) {
			  
				System.out.print("* ");
        
			}
			System.out.println();
			
		}
  }
}
