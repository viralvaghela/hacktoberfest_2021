

//Optional Named Parameters
void main() {

  findVolume(2,breadth: 4,height: 5);
  print("");
  findVolume(2, height:5, breadth:4);
 
}

int findVolume (int length, {int breadth, int height}) {
  
  print("Length is $length");
  print("Breadth is $breadth");
  print("Height is $height");
  
  print("Volume is ${length*breadth*height}");
}
