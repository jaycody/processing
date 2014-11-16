// Daniel Shiffman
// <http://www.shiffman.net>

// Simple object oriented example
// Two "Car" objects
// Cars have color and location --> DATA!
// Cars can drive and be displayed --> FUNCTIONALITY!

// Two global variables
// Instances of Car objects
Car myCar1;
Car myCar2;

void setup() {
  size(200,200);
  // Creating the objects by call the constructor
  // Note the use of 4 parameters -- color, x position, y position, speed, size
  myCar1 = new Car(color(150),0,75,2,20);
  myCar2 = new Car(color(200),0,125,3,40);
}

void draw() {
  framerate(30);
  background(100);
  // Calling functions "render" and "drive" for each car
  myCar1.render();
  myCar2.render();
  myCar1.drive();
  myCar2.drive();
}


// Our car class, we could not use a Car object without it
class Car
{

  // Instance variables
  // Every car object has a color, xposition, yposition, speed, size.
  color c;
  int xpos;
  int ypos;
  int speed;
  int thesize;

  // The constructor definition
  // Takes the arguments passed in and fills the instance variables
  Car(color col, int xp, int yp, int sp, int ts) {
    c = col;
    xpos = xp;
    ypos = yp;
    speed = sp;
    thesize = ts;
  }

  // A function to display the car
  void render () {
    // draw main car body (i.e. a rect)
    rectMode(CENTER);
    stroke(200);
    fill(c);                   
    rect(xpos,ypos,thesize,thesize/2); 
  }


  // A function to move the car
  void drive () {
    xpos = xpos + speed;
    if (xpos > width+thesize) { 
      xpos = -thesize; 
    }
  }
}
