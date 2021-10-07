//Maps (also called hash or dictionary) 
//Maps : unordered collection of key-value pair
//Each key in the map should be unique
//The value can be repeated
//Size of map is not fixed

//Hash map: Implementation of Map based on hash-table
void main() {
  
  Map<String,int> countryDialingCode = {      //Method 1: Using literals
    "USA" : 1,
    "India": 91,
    "Pakistan": 92  
  };
  
  
 Map<String, String> fruits= Map(); //Method 2: Using Constructor
  fruits["apple"] = "red";
  fruits["banana"] = "yellow";
  fruits["orange"] = "orange";
  fruits["guava"] = "yellow";
  fruits["grape"] = "purple";
  
  fruits.containsKey("apple");  //returns true if the KEY is present in Map
  fruits.update("apple",(value) => "green");  //Update the value for the given key
  fruits.remove("banana"); //removes key and its value and returns the value
  fruits.isEmpty;   //returns true if the map is Empty
 fruits.length;    //returns number of elements in map
//  fruits.clear();   //Deletes all elements
 
  print(fruits["apple"]); 
  
  print("\n");
  
  for (String key in fruits.keys) {    //Print all keys
    print(key);
  }
  
  print("\n");
  
  for (String value in fruits.values) {    //Print all values
    print(value);
  }
  
  print("");
  
  fruits.forEach((key,value) => print("key: $key and value: $value")); //Using Lambda
    
    
    
}