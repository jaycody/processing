// create the class for an object to move using PVector

// class has variables for location, velocity, acceleration, biotch.
class Thing {
  PVector loc;
  PVector vel;
  PVector acc;
  PVector dampen;
  float topspeed;


  // the constructor (called when the object is first created)

  Thing (PVector l, PVector v, PVector a, PVector d) {
    loc = l.get();  // examples of embedded PVector objects inside the Thing object
    vel = v.get();
    acc = a.get();
    dampen = d.get();
    topspeed = 10;
  }

  // main function to operate object

  void go () {
    update ();
    checkedges();
    render ();
  }

  void update () {
    // forces interacting:

    //add the current velocity to the location
    loc.add(vel);

    // add current acceleration to velocity
    vel.add(acc);

    // add dampen to acc
    //vel.sub(dampen);

    // limit velocity
    vel.limit(topspeed);
  }


  // function to update location

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
    rectMode(CORNER);
    fill (0,10);
    rect(0,0,width,height);

    // then resets the board for drawing the ball
    rectMode (CENTER);
    stroke (0);
    fill (255,0,0);
    ellipse (loc.x, loc.y, 25,25);

    if (showVectors) {
      drawVector(vel, loc, 10);
    }
  }
}

