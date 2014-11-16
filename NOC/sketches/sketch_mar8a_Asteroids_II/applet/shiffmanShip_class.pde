// create a spaceship class

// Thanks Shiffman!!!
// Nature of Code 2011
// Daniel Shiffman
// Chapter 3: Asteroids

class ShiffmanShip { 
  // All of our regular motion stuff
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass =7;

  // Arbitrary damping to slow down ship
  float damping = 1; //shiffman's original = .995
  float topspeed = 12;

  // Variable for heading!
  float heading = 0;

  // Size
  float r = 25;
  
  // ships MASS


  // Are we thrusting (to color boosters)
  boolean thrust = false;

  ShiffmanShip() {
    location = new PVector(width/2,height/2);
    velocity = new PVector();
    acceleration = new PVector();
  } 
  
  // these functions refer to requests from attractor class for calcForceGravity
  PVector getLoc() {
    return location;
  }

  PVector getVel() {
    return velocity;
  }
  float getMass() {
    return mass;
  }


  // Standard Euler integration
  void update() { 
    velocity.add(acceleration);
    velocity.mult(damping);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass); // ignoring mass right now
    acceleration.add(f);
  }

  // Turn changes angle
  void turn(float a) {
    heading += a;
  }

  // Apply a thrust force
  void thrust() {
    // Offset the angle since we drew the ship vertically
    float angle = heading - PI/2;
    // Polar to cartesian for force vector!
    PVector force = new PVector(cos(angle),sin(angle));
    force.mult(5); // original shiffman code =.5
    applyForce(force); 
    // To draw booster
    thrust = true;
  }

  void wrapEdges() {
    float buffer = r*2;
    if (location.x > width +  buffer) location.x = -buffer;
    else if (location.x <    -buffer) location.x = width+buffer;
    if (location.y > height + buffer) location.y = -buffer;
    else if (location.y <    -buffer) location.y = height+buffer;
  }


  // Draw the ship
  void display() { 
   
    
    pushMatrix();  //rotating the object without rotating the world
    translate(location.x,location.y+r);
    rotate(heading);
    fill(0);
    if (thrust) fill(255,0,0);
    // Booster rockets
    stroke(255);
    rect(-r/2,r,r/3,r);
    rect(r/10,r,r/3,r);
    strokeWeight(5);
    stroke(255);
    fill(0);
    // A triangle
    beginShape();
    vertex(-r,r);
    vertex(0,-r);
    vertex(r,r);
    endShape(CLOSE);
    rectMode(CENTER);
    popMatrix(); //return world to it's original cordinate system.
strokeWeight(0);
    thrust = false;
  }
  
  void display2() { 
   
    
    pushMatrix();  //rotating the object without rotating the world
    translate(location.x,location.y+r);
    rotate(heading);
    fill(0);
    if (thrust) fill(255,0,0);
    // Booster rockets
    stroke(255);
    rect(-r/2,r,r/3,r);
    rect(r/10,r,r/3,r);
    strokeWeight(5);
    stroke(255);
    fill(255,0,255);
    // A triangle
    beginShape();
    vertex(-r,r);
    vertex(0,-r);
    vertex(r,r);
    endShape(CLOSE);
    rectMode(CENTER);
    popMatrix(); //return world to it's original cordinate system.
strokeWeight(0);
    thrust = false;
  }
}

