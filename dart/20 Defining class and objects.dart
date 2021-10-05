

//Defining class and objects
void main() {
  
  var student1 = Student();     //One Object, student1 is reference variable
  student1.id=23;
  student1.name='Sahana';
  print("${student1.id} and ${student1.name}");
  
  student1.study();
  student1.sleep();
  print("");
  var student2 =Student();    //One Object, student2 is reference variable
  student2.id = 45;
  student2.name="Vishnu";
  print("${student2.id} and ${student2.name}");
  
  student2.study();
  student2.sleep();
  
}

class Student{

  int id = -1;     //Instance or field variable, default value is null
  String name;      //Instance or field variable, default value is null

  void study() {
  print("${this.name} is now studying");
  }

  void sleep() {
  print("${this.name} is now sleeping");
  }

}


