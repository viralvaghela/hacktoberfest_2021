void main() {
  
  // IF and ElSE statements
  var salary = 2000;
  
  if (salary>20000) {
   print ("You got a Promotion. Congratulations!!");
  } else {
    print("You need to work hard.");
  }
  
  //IF ELSE IF Ladder statements
  var marks = 96;
  
  if (marks >=90 && marks <=100) {
    print("A+ grade");
  } else if (marks >=80 && marks <90) {
    print ("A grade");
  } else if (marks >=70 && marks <80) {
    print("B grade");
  } else if (marks >=60 && marks <70) {
    print("C grade");
  } else if (marks >=50 && marks <60) {
    print("D grade");
  } else if (marks >=35 && marks <50) {
    print("E grade");
  } else if (marks < 35) {
    print ("Fail");
  } else {
    print ("Invalid marks");
  }
          
  
}