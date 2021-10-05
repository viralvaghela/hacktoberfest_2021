

//Default Optional Parameters
void main() {

  findVolume(2,height:3,breadth:4);
  print("");
  findVolume(2);
 
}

int findVolume (int length, {int breadth=2, int height=20}) {
  
  print("Length is $length");
  print("Breadth is $breadth");
  print("Height is $height");
  
  print("Volume is ${length*breadth*height}");
}
