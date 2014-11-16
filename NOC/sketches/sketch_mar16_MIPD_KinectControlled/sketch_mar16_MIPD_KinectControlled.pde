// jason stephens
// nature of code
// 28 feb 2011
// more gravitational forces
/*
INTERACTION:
 mousePressed = toggle attract and repel between objects
 keyPressed DOWN = toggle show Vectors
 keyPressed RIGHT, LEFT, UP = control of ShiffmanShip
 
 COMPUTING GRAVITY between two masses involves:
 1. d -->the distance between the objects
 2. m1, m2 -->the mass of each object
 3. G -->the force of gravity 
 4. F = (G*m1*m2)/(d*d) [the force of gravity 
 each body exerts on the other (including direction and magnitude]
 
 NEXT TO DO:
 1. everything attracts everything        DONE
 2. array of attractor class              DONE
 2b. insert boolean to turn on and off vector lines  DONE
 2c. create repelling force between objects  DONE
 3. move an attractor with mouse [prepare for moving with gesture]  DONE
 
 5. move an attractor with KINECT
 */

//import the kinect libraries
import org.openkinect.*;
import org.openkinect.processing.*;

// Showing how we can farm all the kinect stuff out to a separate class
KinectTracker tracker;
// Kinect Library object
Kinect kinect;

//adds the option to turn the background screen OFF after calibration
boolean showImage = true;



Mover [] movers = new Mover [50];  //yeah buddy, get with those arrays!!


Attractor [] attractors = new Attractor [1];

ShiffmanShip ship;

boolean showVectors = false;
boolean repel  = true;

void setup() {
  size (1024,768);
  smooth();
  background (0);
  // frameRate(20);

  kinect = new Kinect(this);
  tracker = new KinectTracker();

  ship = new ShiffmanShip ();

  // INITIALIZE the ATTRACTOR array
  for (int i= 0; i<attractors.length; i++) {   // arguments: Loc, mass, Gravitation constant "G"
    if (i != 0) {
      attractors[i] = new Attractor (new PVector (random (0, width), random (0, height)), random (3,40), random (1,5));
    }
    // INITIALIZE the MOUSE controlled Attractor
    attractors[0] = new Attractor (new PVector (mouseX, mouseY), 20, 90);  // arguments: Loc, mass, Gravitation constant "G"
  }



  // INITIALIZE that Mover array
  // turns out that putting the variables inside the for loop works wonders
  for (int i = 0; i<movers.length; i++) {
    PVector loc = new PVector (random(0,width), random(0,height));
    PVector vel = new PVector (random (-1,1),random(-1,1));
    PVector acc = new PVector (0,0);
    float mass = random (1,10);
    float G = .001;
    movers[i] = new Mover (loc, vel, acc, mass, G);  // arguments: loc, vel, acc, mass, Gravity constant
  }
}

void draw () {
  // background (0,100);
  frameRate(20);
  fill (0,100);

  rect(0,0,width, height);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  if (showImage) {
    tracker.display();
  }

//shiffman's code for drawing in the tracker's location
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

  //ShiffmanShip
  // Update location
  // ship.update();
  // Wrape edges
  //ship.wrapEdges();
  // Draw ship
  //ship.display();

  //ShiffmanShip keyPressed Controls
  if (keyPressed) {
    if (key == CODED && keyCode == LEFT) {
      ship.turn(-0.05);
    } 
    else if (key == CODED && keyCode == RIGHT) {
      ship.turn(0.05);
    } 
    if (key == CODED && keyCode == UP) {
      ship.thrust();
    }
    if ((key == CODED && keyCode == UP) && (key == CODED && keyCode == LEFT)) {  // trying to get both to work at once
      ship.turn(-0.05);
      ship.thrust();
    }
  }


  // display eac on the attractor ARRAY
  for (int i = 0; i<attractors.length; i++) {
    if (i != 0) { // if it's NOT MouseAttractor [0]
      attractors[i].display();
    } 
    else {
      attractors[0].mouseControlled();
    }
  }


  // display each instance of mover class
  for (int i = 0; i<movers.length; i++) {
    for (int j = 0; j<movers.length; j++) {
      if (j!=i) {  //so that the mover will not be attracted to itself
        PVector force = movers[j].attract(movers[i]);  // this goes to [j] mover class to calculate force grav
        movers[i].applyforce(force);  //this returns the force from [j] mover and applies it to [i]mover
      }
    }
    movers[i].display();
    movers[i].update();

    // attracting the classes together
    for (int j =0; j<attractors.length; j++) {
      if (j!=0) {  // we want movers attracted to randomly placed attractors.  mouse needsAttractor different functio
        PVector f = attractors[j].calcGravForce(movers[i]);  // calls the attractionOn function from attractor class
        movers[i].applyforce(f);  // then takes that force from attractor and applies it to mover
      } 
      else {  //else if attractor[0] aka MouseAttractor then use separate function yo
        PVector f = attractors[0].calcGravForceMouse(movers[i]);
        movers[i].applyforce(f);
      }
    }
  }
}

// Renders a vector object 'v' as an arrow and a location 'loc'
void drawVector(PVector v, PVector loc, float scayl) {
  if (v.mag() > 0.0) {
    pushMatrix();
    float arrowsize = 4;
    // Translate to location to render vector
    translate(loc.x,loc.y);
    stroke(0);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    stroke(255);
    line(0,0,len,0);
    line(len,0,len-arrowsize,+arrowsize/2);
    line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  }
}

void mousePressed() {
  showImage = !showImage;
  repel = !repel;
}

void keyPressed() {  //shimans
  if (keyPressed) {
    if (key == CODED) {
      if((keyCode != LEFT) && (keyCode != RIGHT) && (keyCode != UP)) {
        showVectors = !showVectors;
      }
    }
  }
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

