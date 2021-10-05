//List: Array in dart is known as list
// Fixed Length List
void main() {
  
  //Elements: 
  //Index:  
  
  List<String> countries = ["USA", "India", "Nepal"];   //Growable list: Method 1
  countries.add("Japan");
  
  
  List<int> numbersList = List();    //Growable List: Method 2
  numbersList.add(73);    //Insert Operation
  numbersList.add(64);
  numbersList.add(21);
  numbersList.add(12);
  
  numbersList[0] = 99;    //Update operation
  numbersList[1] = null;   //Delete Operation
  
  print(numbersList[0]);
  
  numbersList.remove(99); //Operations not supported in Fixed Length List
  numbersList.add(24);
  numbersList.removeAt(3);
  numbersList.clear();
  
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

