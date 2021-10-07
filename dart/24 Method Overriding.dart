

//Method Overriding
void main() {
  
  var dog =Dog();
  dog.eat();
  
  print(dog.color);
  
}

class Animal {
  
  String color = "brown";
  
  void eat() {
    print("Animal is eating");
  }
}

class Dog extends Animal {
  
  
  String breed;
  
  String color="Black";
  
  void bark() {
    print("Bark");
  } 
  
  void eat() {
   
    print("Dog is eating");
    super.eat();
    print("Dog wants More food to eat");
  }
}

