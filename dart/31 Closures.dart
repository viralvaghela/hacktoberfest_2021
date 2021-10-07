//Functional Programming

//Closures: 

void main() {
  
  //Closure is afunction that has access to parent scope, even after the scope has closed.
  
  String message = "Dart is good";
  
  Function showMessage = () {
    message = "Dart is Awesome";
    print(message);
  };
  print(message);
  showMessage();
  print(message);
  print("");
  
  // A closure is a function object that has access to variables in its lexical scope, even when the function is used outside its original scope.
  
  Function talk = () {
    
    String msg="Hi";
    
    Function say = () {
      
      msg="Hello";
      print(msg);
      
    };
    
    return say;
  };
  
  var speak = talk();
  
  speak();
  
  
}

