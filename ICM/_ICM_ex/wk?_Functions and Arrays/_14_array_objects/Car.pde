// Our car class, we could not use a Car object without it
class Car
{

  // Instance variables
  // Every car object has a color, xposition, yposition, speed, size.
  color c;
  float xpos;
  float ypos;
  float speed;
  float thesize;

  // The constructor definition
  // Takes the arguments passed in and fills the instance variables
  Car(color col, float xp, float yp, float sp, float ts) {
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
    noStroke();
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
