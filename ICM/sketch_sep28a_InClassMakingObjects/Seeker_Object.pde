class Seeker {  // creat the class of object called Seeker
  float x;//  variables are declared
  float y;
  float r;

  Seeker(float tempX) {  // Constructor (like setup for the object)
    x=tempX;    // tempX is receiving the value from the constructor.  pass the value from the outside into object.
    y=100;    // initializes the variables
    r=100;
  }
  void display(){   // these are the functions that are specific to this object.
    fill(0);
    ellipse(x,y,r,r);
  }
  
  void (move){   // this is also a function that are part  of the object SEEKKER
  y = y - 1;
  }
}
