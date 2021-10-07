//Functional Programming

//Higher Order funtion: Accepts a function as a Parameter or returns a function 

void main() {
 
  Function add2nums = (int a, int b) => print(a+b);
  someOtherFunction("Hello",add2nums );
  
  var myFunc = taskToPerform();
  print(myFunc(10));
  
}

//Higher order function
void someOtherFunction(String message, Function myFunction) {
 
  print(message);
  myFunction(2,5);    //add2nums (2,5); //print(a+b); //print(2+5) //output:7
  
}

//Higher order function
Function taskToPerform() {
  
  Function multiply4 = (int number) => number*4;
  return multiply4;
}
