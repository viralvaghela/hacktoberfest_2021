//Static methods and variables
void main() {
  var circle1 = Circle();
  //circle1.pi;  //4 bytes

  var circle2 = Circle();
  //circle2.pi; //4 bytes

  Circle.pi; //4 bytes
  Circle.pi; //No memory is allocated

  print(Circle.pi);

  Circle.calculate_area();

  circle1.myNormalfuction();
}

class Circle {
  static const double pi = 3.14;

  static int maxRadius = 5;

  String color;

  static void calculate_area() {
    print("Calculate area of circle");
    //  myNormalfunction();    //Not allowed to call instance functions
    //this.color;  //Cannot use 'this' keyword and cannot access Instance variables
  }

  void myNormalfuction() {
    Circle.calculate_area();
    this.color = "pink";
    print(pi);
    print(Circle.maxRadius);
  }
}
