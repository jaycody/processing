// mouse accelerator class, biotch

class HandFollower {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  float xoff,yoff;
  float mxoff, myoff;
  float handX, handY;

  HandFollower(float _ax, float _ay, float _handX, float _handY) {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 10;
    xoff = 1000;
    yoff = 0;
    mxoff = _ax;
    myoff = _ay;
    handX = _handX;
    handY = _handY;
  }
  void go(){
    update ();
    display();
    checkEdges();
  }

  void update() {
    
    float ax = map(noise(mxoff),0,1,-100,100);
    float ay = map(noise(myoff),0,1,-100,100);
    
    // grab those other functions and import them
    float vx = v2.x.get();
    float vy = v2.y.get();

    PVector mouse = new PVector(vx+ax,vy+ay);
    xoff += 0.01;
    yoff += 0.01;
     mxoff += 0.01;
    myoff += 0.01;
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();
    dir.mult(2);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    fill(0,0,255);
    ellipse(vx,vy,26,26);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } 
    else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } 
    else if (location.y < 0) {
      location.y = height;
    }

  }

}
