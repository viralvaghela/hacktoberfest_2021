//Sets: 
// Unordered Collection
//No duplicate elements: All elements are Unique
//Cannot get elements by Index
void main() {
  
  
  Set<String> countries = Set.from(["USA", "India", "Nepal"]);   // Method 1: From a List
  countries.add("Japan");
  countries.add("Germany");
  
  
  Set<int> numbersSet = Set();    //Method 2: Using Constructor
  numbersSet.add(73);    //Insert Operation
  numbersSet.add(64);
  numbersSet.add(21);
  numbersSet.add(12);
  
  numbersSet.add(73); //Duplicate entries are ignored
  
 numbersSet.contains(73); //returns true if the element is found in the set
  numbersSet.remove(64);  //returns true if the element was found and deleted.
  numbersSet.isEmpty; //returns true if the set is empty
  numbersSet.length; //returns number of elements in the set
  numbersSet.clear(); //Deletes all elements from the set
  
 
  print("\n");
  
  for (int element in numbersSet) {    //Using Individual Element objects
    print(element);
  }
  
  print("\n");
  numbersSet.forEach((element) =>  print(element)); //Using Lambda
  
 
  
  

  
}

