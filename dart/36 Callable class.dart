//Callable class
//A Dart class that can be called like a function
//Implement call() method in class

void main() {
  
  var person1 = Person();
  var msg = person1(25,"Ram");
  print(msg);
  
}

class Person {
  
  call(int age, String name) {
    return "The name of the person is $name and age is $age. ";
  }
}