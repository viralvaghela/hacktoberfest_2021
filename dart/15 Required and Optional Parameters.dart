
void main() {

  print_cities("New York","Delhi",  "Sydney");
  print("");
  print_countries("India", "Australia" );
  
}

//Required Parameters
void print_cities(String name1, String name2, String name3) {
  
  print("Name 1 is $name1");
  print("Name 2 is $name2");
  print("Name 3 is $name3");
}

//Optional positional Parameters
void print_countries([String name1, String name2, String name3]) {
  
  print("Name 1 is $name1");
  print("Name 2 is $name2");
  print("Name 3 is $name3");
}
