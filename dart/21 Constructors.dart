


void main() {
  
  var student1 = Student(23,"sahana");     //One Object, student1 is reference variable
  student1.id=23;
  student1.name='Sahana';
  print("${student1.id} and ${student1.name}");
  
  student1.study();
  student1.sleep();
  print("");
  var student2 =Student(45,"sam");    //One Object, student2 is reference variable
 
  print("${student2.id} and ${student2.name}");
  
  student2.study();
  student2.sleep();
  
  print("");
  
  var student3 = Student.myCustomConstructor(); //One object, student3 is reference variable
  student3.id=54;
  student3.name="Hari";
  print("${student3.id} and ${student3.name}");
  
  print("");
  var student4 = Student.myAnotherNamedConstructor
  (87, "Ram");
  print("${student4.id} and ${student4.name}");
}

class Student{

  int id = -1;     //Instance or field variable, default value is null
  String name;      //Instance or field variable, default value is null

  //Default Constructor
  
  //Parameterized Constructor
  Student(this.id, this.name) ;
  
  //Named Constructor
  Student.myCustomConstructor() {
    print("This is my custom constructor");
  }
  
  //Named Constructor
  Student.myAnotherNamedConstructor(this.id, this.name);
  
  void study() {
  print("${this.name} is now studying");
  }

  void sleep() {
  print("${this.name} is now sleeping");
  }

}


