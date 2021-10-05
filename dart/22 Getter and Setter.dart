


void main() {
  
  var student =Student();
  student.name= "Sahana";  //Calling default setter to set the value
  print(student.name);    //Calling default getter to get the value
  
  student.percentage =438.00; //Calling custom setter to set value
  
  print(student.percentage);
  
}

class Student {
  
  String name;  //Instance variable with default getter and setter
  
  
  double _percent;   //Private instance variable for its own library
  
  //Instance variable with custom setter
  void set percentage(double marks_secured) => _percent= (marks_secured /500) *100;
  
   //Instance variable with custom getter
  double get percentage =>  _percent;

}



