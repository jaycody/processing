// create the random acceleration class

class RandomAccelerator {

  PVector loc;
  PVector vel;
  PVector rac;
  float topspeed;
  float radius;




  RandomAccelerator (PVector l, PVector v, PVector r) {
    loc = l.get();
    vel = v.get();
    rac = r.get();
    topspeed = 10;
    // radius = random (5,25);
  }

  // main functions
  void go () {
    update();
    checkedges();
    render();
  }

  void update () {
    rac = new PVector (random(-1,1), random (-1,1));
    rac.normalize ();
    rac.mult(random(2));

    loc.add(vel);
    vel.add(rac);
    vel.limit(topspeed);
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
  void render() {

    /* this is great code here. 
     shiffman covers each frame with
     a square the size of the screen 
     and an alpha of 10 to give the effect
     of the ball disappearing.
     */
    for (int i = 1; i>200; i=i+1) {  //wtf?  why isn't this forLOOP working?
      rectMode(CORNER);
      fill (0);
      rect(0,0,width,height);
      i=0;

       }

      // then resets the board for drawing the ball
      rectMode (CENTER);
      stroke (0);
      fill (255,0,0);
      radius = random (5,15);
      ellipse (loc.x, loc.y, radius,radius);
    }
  }

