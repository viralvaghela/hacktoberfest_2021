void main() {

//Continue keyword
//Using Labels

 outer: for (int i=1; i<=3; i++) {
   
    inner: for (int j=1; j<=3;j++) {
      if(i==2 && j==2)
        continue outer;
      print("$i  $j");
    }
  }

}