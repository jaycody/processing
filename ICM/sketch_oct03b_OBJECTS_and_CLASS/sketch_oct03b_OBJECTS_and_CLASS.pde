//Jason Stephens
//Object Oriented Programming practice 2

//CREATING AN OBJECT
//1.Declare Object  (as a global variable above setup)
//2.Initialize Object (in setup by calling constructor)
//3.Call Methods on the object (operate object in draw-
//        by calling object methods using the dots syntax).


//DEFINING A CLASS on SECOND TAB (or after the rest of program)



//  1. declare the object
Car myCar;


//  2. initialize the object in setup by calling the constructor in setup
void setup(){
  size (200,200);
  myCar = new Car();
}


//  3. call methods on the object in draw using the dots syntax
void draw(){
  background(0);
  //operate the car object
  myCar.move();
  myCar.display();
}




