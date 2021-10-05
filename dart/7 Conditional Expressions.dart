void main() {
  
  //Conditional Expressions
  // 1. condition ? expression1 : expression2;
  
  int a=8;
  int b=3;
  

 // a < b ? print ("$a is smaller") : print ("$b is smaller");
  int smallnumber = a<b ? a : b;
  print("$smallnumber is smaller");


// 2. expression1 ?? expression2
  String name ='Sahana' ;
  String nametoprint = name ?? "Guest User";
  print (nametoprint);
  
}