

//Constructor Inheritance
void main() {
  
  var dog1 = Dog("Labrador", "Black");
  
  print("");
  
  var dog2 =Dog("Pug", "Brown");
  
   print("");
  var dog3 =Dog.myNamedConstructor("German Shepherd", "Yellow");
  
}

class Animal {
  
  String color = "brown";
  
  Animal(String color) {
    this.color = color;
    print("Animal class constructor $color");
  }
  
  Animal.myAnimalConstructor(String color) {
    print("Animal class named constructor");
  }
  
}

class Dog extends Animal {

  String breed;
  
  Dog(String breed, String color) : super(color) {
    this.breed= breed;
    print("Dog class constructor");
  }
  
  Dog.myNamedConstructor(String breed, String color) : super.myAnimalConstructor(color) {
    this.breed= breed;
    print("Dog class named constructor");
  }

}








