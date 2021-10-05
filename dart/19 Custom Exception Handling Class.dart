

//Exception Handling
void main() {

 /* print("Case 1");
  //When you know the exception to be thrown, use ON clause
  try {
  int result =12~/0;
  print("Result is $result");
  } on IntegerDivisionByZeroException {
    print("Cannot divide by zero");
  }
  */
 print("");
  
 print("Case 2");
  //When you do not know the exceptiion to be thrown, use CATCH clause
  try {
  int result =12~/0;
  print("Result is $result");
  } catch (e) {
    print("The exception thrown is $e");
  }
  print("");
  
 print("Case 3");
  //STACK TRACE
  try {
  int result =12~/0;
  print("Result is $result");
  } catch (e,s) {
    print("The exception thrown is $e");
    print("STACK TRACE \n $s");
  }
  
   print(""); 
  
 print("Case 4");
  //Whether exception is there or not, FINALLY clause is always executed
  try {
  int result =12~/6;
  print("Result is $result");
  } catch (e) {
    print("The exception thrown is $e");
  } finally {
    print("This is finally clause and is always executed");
  }
  
  print("");
  print("Case 5");
  try {
  depositmoney(-800);
  } catch(e) {
    print(e.errorMessage());
  } finally {
    print("This is finally clause");
  }
    
}

class DepositException implements Exception {
  String errorMessage() {
    return "You cannot enter amount less than 0";
  }
  
}

void depositmoney(int amount) {
  if(amount<0) 
    throw new DepositException();
}






