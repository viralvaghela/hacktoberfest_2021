//List: Array in dart is known as list
// Fixed Length List
void main() {
  
  //Elements: N   N   N   N   N   //Elements of list are initially null
  //Index:    0   1   2   3   4
  
List<int> numbersList = List(5);    //Fixed length list
  numbersList[0] = 73;    //Insert Operation
  numbersList[1] = 45;
  numbersList[4] = 12;
  numbersList[3] = 21;
  
  numbersList[0] = 99;    //Update operation
  numbersList[1] = null;   //Delete Operation
  
  print(numbersList[0]);
  
 // numbersList.remove(99); //Operations not supported in Fixed Length List
 // numbersList.add(24);
 // numbersList.removeAt(3);
 // numbersList.clear();
  
  print("\n");
  
  for (int element in numbersList) {    //Using Individual Element objects
    print(element);
  }
  
  print("\n");
  numbersList.forEach((element) =>  print(element)); //Using Lambda
  
  print("\n");
  for (int i=0; i<numbersList.length; i++) {      //Using Index
    print(numbersList[i]);
  }
  
  

  
}

