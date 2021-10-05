

//Abstract method and class
void main() {
  
  //var shape =shape(); //Error: can't instantiate abstract class
  
  var rectangle = Rectangle();
  rectangle.draw();
  
  var circle = Circle();
  circle.draw();

}


abstract class Shape {
  
  int x, y;
  
  void draw();  //Abstract method
  
  void myNormalfuntion() {
    
  }
  
}

class Rectangle extends Shape {
  
  
  void draw() {
    print("Drawing Rectangle");
  }
}

class Circle extends Shape {
  
  void draw() {
    print("Drawing Circle");
  }
  
}


