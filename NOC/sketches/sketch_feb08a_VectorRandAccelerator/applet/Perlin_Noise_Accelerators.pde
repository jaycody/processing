// create the Perlin Noise class

class Perlin {
  PVector loc;
  PVector vel;
  PVector per;
  float topspeed;
  float radius;
  
  //for perlin noise variables
  float xoff, yoff;
  
  Perlin (float _xoff, float _yoff) {
    loc = new PVector (random(0,width), random (0,height));
    vel = new PVector (0,0);
     topspeed = 10;
    //radius = random (20,45);
    xoff = _xoff;
    yoff = _yoff;
  }
  
//  Perlin( PVector l, PVector v, PVector p) {
//    loc = l.get();
//    vel = v.get();
//    per = p.get();
//    topspeed = 20;
//    radius = random (20,35);
//    xoff = 1000;
//    yoff = 0;
//    
//  }
  
  void go () {
    render ();
    update ();
    checkedges ();
  }
  
  void render() {

    /* this is great code here. 
     shiffman covers each frame with
     a square the size of the screen 
     and an alpha of 10 to give the effect
     of the ball disappearing.
     */
    rectMode(CORNER);
    fill (0,10);
    rect(0,0,width,height);

    // then resets the board for drawing the ball
    rectMode (CENTER);
    stroke (0);
    fill (0,255,0);
    ellipse (loc.x, loc.y, radius,radius);
  }
  
  void update () {
    
    float ax = map(noise(xoff),0,1,-1,1);
    float ay = map(noise(yoff),0,1,-1,1);
    per = new PVector (ax,ay);
    xoff += 0.01;
    yoff += 0.01;
    
    loc.add(vel);
    vel.add(per);
    vel.limit(topspeed);
    
    radius = noise (xoff)*50;
  }
    
    
    void checkedges () {
    if (loc.y > height) {
      vel.y *= -1;
      loc.y = height;
      //loc.y = 0;
    }
    if (loc.y < 0) {
      vel.y *= -1;
      loc.y = 0;
    }
    if (loc.x > width) {
      vel.x *= -1;
      loc.x = width;
      //loc.x =0;
    }
    if (loc.x < 0) {
      vel.x *= -1;
      loc.x = 0;
    }
   }
}
