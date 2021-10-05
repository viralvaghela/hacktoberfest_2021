void main() {

  
  Find_Perimeter(4,2);
 int area= getArea(4,2);
  print("Area of rectangle is $area");
}

void Find_Perimeter(int length, int breadth) {
  int perimeter = 2* (length+breadth);
  print("The perimeter of rectangle is $perimeter");
}

int getArea (int length, int breadth) {
  int area=length*breadth;
  return area;
}