// jason stephens
// nature of code
// wk_2 PVectors with Random Acceleration

// http://www.shiffman.net
// https://github.com/shiffman/libfreenect/tree/master/wrappers/java/processing

import org.openkinect.*;
import org.openkinect.processing.*;

//


RandomAccelerator R;
RandomAccelerator R1;
RandomAccelerator R2;

Perlin P;
Perlin P1;
Perlin P2;

MouseAccelerator M;
MouseAccelerator M1;
MouseAccelerator M2;

// Showing how we can farm all the kinect stuff out to a separate class
KinectTracker tracker;
// Kinect Library object
Kinect kinect;

//adds the option to turn the background screen OFF after calibration
boolean showImage = true;

void setup() {
  // my original code
//  size (800,800);
//  fill (0);
//  background (0);

// from Shiffman Point Tracking
 size(640,520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  
  
  
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
  
  // and now the MouseControlled ellipses
  M = new MouseAccelerator();
  M1 = new MouseAccelerator();
  M2 = new MouseAccelerator();
}


void draw () {
  R.go();
  R1.go ();
  R2.go ();
  P.go();
  P1.go();
  P2.go();
  M.go();
   M1.go();
    M2.go();
     //background(255);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  if (showImage) {
    tracker.display();
  }

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50,100,250,200);
  noStroke();
  ellipse(v1.x,v1.y,20,20);

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100,250,50,200);
  noStroke();
  ellipse(v2.x,v2.y,20,20);

  // Display some info
  int t = tracker.getThreshold();
  fill(0);
  text("threshold: " + t + "    " +  "framerate: " + (int)frameRate + "    " + "UP increase threshold, DOWN decrease threshold",10,500);
}
void mousePressed() {
  showImage = !showImage;
}

void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } 
    else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}

void stop() {
  tracker.quit();
  super.stop();
}




