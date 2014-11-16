// mouse accelerator class, biotch

class MouseAccelerator {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  float xoff,yoff;
  float mxoff, myoff;

  MouseAccelerator(float _ax, float _ay) {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 10;
    xoff = 1000;
    yoff = 0;
    mxoff = _ax;
    myoff = _ay;
    
  }
  void go(){
    update ();
    display();
    checkEdges();
  }

  void update() {
    
    float ax = map(noise(mxoff),0,1,-100,100);
    float ay = map(noise(myoff),0,1,-100,100);

    PVector mouse = new PVector(mouseX+ax,mouseY+ay);
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
    ellipse(location.x,location.y,26,26);
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
