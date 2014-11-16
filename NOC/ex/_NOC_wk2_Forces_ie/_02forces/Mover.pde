class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    location = new PVector(30,30);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 1;
  }
  
  /*tracking the dataflow of the following function:  applyForce
 for each applyForce Function, the variable is passed in, divided by mass,
and then added to acceleration. then acceleration is reset to ZERO in the 
update function.  at each iteration, the force is accumulated as reapplied
to the acceleration, which in turn is reapplied to the velocity.  this is how 
FORCES ACCUMULATE.  
  */
  void applyForce(PVector force) {  //where both gravity and wind are forces
    PVector f = PVector.div(force,mass);   //acceleration = force/mass
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);  //
  }

  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,16,16);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }

  }

}



