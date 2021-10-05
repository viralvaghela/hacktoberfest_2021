void main() {

 //Break keyword
  // Using labels
  outer_loop: for (int i=1; i<=3; i++) {
   inner_loop: for (int j=1; j<=3; j++) {
      print('$i $j');
      
      if (i==2 && j==2)
        break outer_loop;
    
    }
  }
        

}