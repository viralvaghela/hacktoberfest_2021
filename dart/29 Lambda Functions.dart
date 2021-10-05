//Functional Programming

//anonymous function or Lambda Expression : Function without a name

void main() {
  //1st way
  Function add2nums = (int a, int b) {
    var sum = a + b;
    print(sum);
  };

  var multiply4 = (int number) {
    return number * 4;
  };

  //2nd way: Function expression: Using short hand syntax
  Function addnums = (int a, int b) => print(a + b);

  var multiplyBy4 = (int number) => number * 4;

  //Calling lambda functions
  add2nums(2, 5);
  print(multiply4(7));

  addnums(3, 7);
  print(multiplyBy4(10));
}

//Normal function
void addMyNumbers(int a, int b) {
  var sum = a + b;
  print(sum);
}
