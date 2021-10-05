

//expression in Functions: Short Hand Syntax
void main() {

  
  Find_Perimeter(4,2);
  int area= getArea(4,2);
  print("Area of rectangle is $area");
  
}

void Find_Perimeter(int length, int breadth) => print("The perimeter of rectangle is ${2* (length+breadth)}");


int getArea (int length, int breadth)=> length*breadth;