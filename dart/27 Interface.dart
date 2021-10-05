

//Interface: No interface in dart; So use class as interface 
//Normal class can act as interface in dart
void main() {
  
  var tv = Television();
  tv.volumeDown();
  tv.volumeUp();

}


class Remote {
  
  void volumeUp() {
    
    print("Volume up for remote");
  }
  
  void volumeDown() {    
    print("Volume down for remote");    
  }
  
}

class Anotherclass {
  
  void anothermethod() {
    
  }
  
}

//Here Remote acts as Interface
class Television implements Remote, Anotherclass {
  
  void volumeUp() {
    print("Volume up for television");
  }
  
  void volumeDown() {
    print("Volume down for television");
  }
  
  void anothermethod() {
    print("Some code");
  }  
  
}