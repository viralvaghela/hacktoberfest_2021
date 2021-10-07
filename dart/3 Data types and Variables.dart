/* Data types in dart
 * Numbers: int, double
 * Strings
 * Booleans
 * Lists
 * Maps
 * Runes (Unicode characters in a string)
 * Symbols
 * 
 All data types are basically objects: 
 So default is Null */

// Variable declaration

 //Data type of var depends on value assigned at right.

void main() {
  
  //Numbers: int
  int score = 50;
  var count = 25; //It is inferred as integer automatically   by the compiler
  
  var hexValue =0xADFBBCEF;
 
  //Numbers: double
  double percentage = 96.3;
  var percent =99;
  double expo = 5.25e4;
  var exponents = 3e5;
  
  
  //Strings
  String name='Sahana';
  var company = "Stanford Technovision";
  
  //Boolean 
  bool isValid ;
  var isAlive = true;
  
  print( score);
  print(count);
  print(hexValue);
  print(percentage);
  print(percent);
  print(expo);
  print(exponents);
  print(name);
  print(company);
  print(isValid);
  print(isAlive);
  
  
}
