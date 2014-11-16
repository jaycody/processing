import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class sketch_feb08a_VectorRandAccelerator extends PApplet {

// jason stephens
// nature of code
// wk_2 PVectors with Random Acceleration

RandomAccelerator R;
RandomAccelerator R1;
RandomAccelerator R2;

Perlin P;
Perlin P1;
Perlin P2;

MouseAccelerator M;
MouseAccelerator M1;
MouseAccelerator M2;


public void setup() {
  size (800,800);
  fill (0);
  background (0);

  // location, velocity and random acceleration for Random Accelerator

  PVector l = new PVector (random(width), 0);
  PVector v = new PVector (1, 0);

  PVector r = new PVector (random(-1,1), random(-1,1));
  r.normalize();
  //racc.mult(.5); // scaling to a constant value
  r.mult(random(2)); // scaling to a random


  R = new RandomAccelerator(l,v,r);
  R1 = new RandomAccelerator(l,v,r);
  R2 = new RandomAccelerator(l,v,r);

  // meanwhile we have Perlin Acceleration
  P= new Perlin(random (1,1000), random (1,1000));
  P1 = new Perlin(random (1,1000), random (1,1000));
  P2 = new Perlin(random (1,1000), random (1,1000));
  
  M = new MouseAccelerator(random (1,1000), random (1,1000));
  M1 = new MouseAccelerator(random (1,1000), random (1,1000));
  M2 = new MouseAccelerator(random (1,1000), random (1,1000));
}


public void draw () {
  R.go();
  R1.go ();
  R2.go ();
  P.go();
  P1.go();
  P2.go();
  M.go();
   M1.go();
    M2.go();
}



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
  public void go(){
    update ();
    display();
    checkEdges();
  }

  public void update() {
    
    float ax = map(noise(mxoff),0,1,-100,100);
    float ay = map(noise(myoff),0,1,-100,100);

    PVector mouse = new PVector(mouseX+ax,mouseY+ay);
    xoff += 0.01f;
    yoff += 0.01f;
     mxoff += 0.01f;
    myoff += 0.01f;
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();
    dir.mult(2);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  public void display() {
    stroke(0);
    fill(0,0,255);
    ellipse(location.x,location.y,26,26);
  }

  public void checkEdges() {

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
  
  public void go () {
    render ();
    update ();
    checkedges ();
  }
  
  public void render() {

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
  
  public void update () {
    
    float ax = map(noise(xoff),0,1,-1,1);
    float ay = map(noise(yoff),0,1,-1,1);
    per = new PVector (ax,ay);
    xoff += 0.01f;
    yoff += 0.01f;
    
    loc.add(vel);
    vel.add(per);
    vel.limit(topspeed);
    
    radius = noise (xoff)*50;
  }
    
    
    public void checkedges () {
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
  public void go () {
    update();
    checkedges();
    render();
  }

  public void update () {
    rac = new PVector (random(-1,1), random (-1,1));
    rac.normalize ();
    rac.mult(random(2));

    loc.add(vel);
    vel.add(rac);
    vel.limit(topspeed);
  }

  public void checkedges () {
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
  public void render() {

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

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "sketch_feb08a_VectorRandAccelerator" });
  }
}
