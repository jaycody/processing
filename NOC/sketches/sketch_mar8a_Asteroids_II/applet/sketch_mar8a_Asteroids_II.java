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

public class sketch_mar8a_Asteroids_II extends PApplet {

// jason stephens
// nature of code
// Using the FORCE

/* 
 INTERACTION:
 KeyPressed = showVectors being objects and Attractors
 SpaceBar = toggle showVectors between Moving Objects
 key 'v' = show all asteroid vectors
 Mouse.Location = primary attractor
 mousePressed = toggle Attraction / Repel
 
 FORCES: 
 1. Attraction - gravitational from center object
 2. Wind - one direction through purple stripe, another direction in green stripe
 3. Drag - inside the randomly placed grey liquids AND inside mouse controlled box
 4. Friction - inside green stripe
 5. working on everthing attracting everything else
 
 
 NEXT TO DO:
 0. create an array of attractors [even if it's just for ONE]   DONE
 0a. create one attractor that is mouse controlled              DONE
 1. insert vector arrows for the moving objects                 DONE
 2. insert boolean to turn on/off vector lines                  DONE
 3. everything attracts everything [except itself]              DONE
 4. create repeling force between objects but attraction to mouse controlled mass DONE!!!
 .        [#4 by adding a -1 multiplier to the gravitatinal formula!!!]
 
 4.1 save this sketch as a new sketch, just in case something happens  DONE
 4a. Add ShiffmanShip Class!                                    DONE
 4b. Subject Shiffman ship to the forces of nature
 .      1. overall gravity  DONE
 .      2. wind             DONE
 .      3. attractor grav
 .          a. create array of ships  DONE
 .          b. create functions in attractor for attractor to ship attraction
 .          c. create functions in ship class for ship to ship attraction
 .      4. display vectors for ships
 .      4a seperate out the ship controls from the vector drawings of the asteroids  DONE
 .      5. stitch together and upload a compilation video of the projgress
 .      6. ADD Color as an arugment to the vector drawing function
 .      7. include slow down abilit for test vehicle
 
 4c. Map gravitational constant to mouseX
 4c1 Toggle trackpad control between planet location control and gravitational constant
 
 5. control attractor using blob detection
 6. enter OSCILLATIONS [better late than never. thank god from spring break to catch up]
 7. get to particle systems
 
 
 POSSIBLES:
 1. Potentiameter to control the Gravitational Constant [where center may be 0 and negative repels]
 2. Sliders to control wind direction
 3. Create an EDIT mode where liquid can be moved around
 
 
 */




//array of moving objects
Lover [] lovers = new Lover [25];   // LOVER Class Arguments = loc.x, loc.y, w, h, mass, topspeed

//array of drag locations Liquid
Liquid [] liquids = new Liquid [10];

// an array of Attractors
Attractor [] attractors = new Attractor [3];

// array of ShiffmanShips
ShiffmanShip [] ships = new ShiffmanShip [2];


boolean showVectors = false;
boolean repel = false;
boolean showMutualAttractions = false;

PVector wind;
PVector gravity;
PVector otherwind;
PVector otherwind2;
float G; //gravitational constant for 
float topspeed; // so shit don't get out of control
float mew;  // coefficient of friction

public void setup () {
  smooth();
  size (1200,600);
  background (0);
  fill (255);
  frameRate(100);

  wind = new PVector (0,0);
  otherwind = new PVector (2,.1f);
  otherwind2 = new PVector (-2,-.6f);
  gravity = new PVector (0,.5f);
  topspeed = 15;
  mew = 0;  //Coefficient of Friction for a given surface:  how much friction in this world

  //+++++++INITIALIZE SHIPS []
  for (int i = 0; i<ships.length; i++) {
    ships[i] = new ShiffmanShip ();  //arguments??
  }

  //+++++++INITIALIZE Attractor []++++++++arguments: PVector loc, mass, Gravitational Constant
  for (int i = 0; i<attractors.length; i++) {
    if (i != 0) {  // random parameters for all other attractors in the array
      attractors[i] = new Attractor (new PVector (random(0,width), random(0,height)), random (20, 30), random (2,3));
    }
    attractors[0] = new Attractor (new PVector(width/2, height/2), 30, 3.5f); // consistant mouse controlled mass
  }

  //++++++INITIALIZE Liquid [] ++++++++++arguments: loc.x, loc.y, w, h, Coefficient of DRAG
  for (int i = 0; i<liquids.length; i++) {
    liquids[i] = new Liquid (random(0,width), random(0,height), random (5,70), random (5,50), random (0, 1));
  }

  //+++++INITIALIZE Lover []++++++++++arguments: loc.x, loc.y, mass,, topspeed, drawVectorSize, Gravitational Constant
  for (int i = 0; i<lovers.length; i ++) {
    lovers[i] = new Lover (random (0,width),0, random (5,15), 10, 100, 1);
  }
}

public void draw () {
  //background (0);
  fill (0,50);
  rectMode(CORNER);
  rect(0,0,width,height);

  // boolean switches for reals
  if (keyPressed) {  // acts as a switch with the keyboard
    if(key == 'v') {
      showVectors = !showVectors;
    }
  }

  //shiffmanShip ships [] FOR LOOP
  for (int i = 0; i<ships.length; i++) {

    //...this block is inside the ships[] for loop. 
    //Update location of ships
    ships[i].update();
    // Wrape edges
    ships[i].wrapEdges();
    // Draw ship
    ships[i].display();

    //apply forces to the ship
    ships[i].applyForce (gravity);
    ships[i].applyForce (otherwind);
    ships[i].applyForce (otherwind2);
    
      // SEND Each SHIP[i] to EACH attractors[j] (except MOUSE ATTRACTOR and RETURN GravForce -> Nested ForLoop
    for (int j= 0; j<attractors.length; j++) {
      if (j !=0) {  // calc grav each attractor (except MOUSE ATTRACTOR) has on each lover
        PVector f = attractors[j].calcGravForce(ships[i]);  //function to send each Lover to attractor class
        ships[i].applyForce(f);  // function in attractor class returns PVector f and applies it to each
      }
       else {  //if attractor[0] MOUSE ATTRACTOR, then use THIS function for calc grav at mouse location to all LOVERS
        PVector f = attractors[0].calcGravForceMouse (ships[i]);
        ships[i].applyForce(f);
        if (showVectors) {
            drawVector (f, ships[i].getLoc(), 200);  // Draw gravitational force VECTORS
        }
    }
    }
    
    /*___________________DRAG________________
     _______Appl DRAG to every lovers[] that moves through any liquids[] -> Nested ForLoop 
     --constantly asking boolean to return true */
    for (int j =0; j< liquids.length; j++) {
      if (liquids[j].contains(ships[i])) {
        PVector drag = liquids[j].drag(ships[i]);
        ships[i].applyForce(drag);
        ships[i].display2(); // display2() changes the color of object as it moves through liquid
      }
    }

    //ShiffmanShip keyPressed Controls
    if (keyPressed) {
      if (key == CODED && keyCode == LEFT) {
        ships[0].turn(-0.05f);  // TURN only if you are ship #0 in the array!
      } 
      else if (key == CODED && keyCode == RIGHT) {
        ships[0].turn(0.05f);  // only ship #0 turns
      } 
      if (key == CODED && keyCode == UP) {
        ships[0].thrust();// only the functional ship [0] thrusts
      }
      if ((key == CODED && keyCode == UP) && (key == CODED && keyCode == LEFT)) {  // trying to get both to work at once
        ships[0].turn(-0.05f); // only ship [0] turns
        ships[0].thrust();  // only ship [0] turns
      }
    }
  }

  //Display Attractor [] -> ForLoop
  for (int i= 0; i<attractors.length; i++) {
    if(i!=0) { // display the arttractors[] except for [0] which is mouse controlled
      attractors[i].display();
    }
    attractors[0].mouseControlled();// if you are [0] then use other fucnction to calc location
  }

  //Display Liquids [] -> ForLoop
  for (int i = 0; i<liquids.length; i++) {
    liquids[i].display();
  }
  // liquids[0].update();  //this is the mouse controlled liquid


//  // Draw WIND ZONES
//  //___OTHERWIND2 ZONE
//  fill (0,255,0,100);
//  rectMode (CORNER);
//  rect (0,height/1.5,width, height/1.5);
//  //____OTHERWIND ZONE
//  fill (255,0,255,50);
//  rect (0,height/4,width,height/2-height/4);
//  rectMode (CENTER);




  // Lovers[] forLoop -> applyforces (friction, otherwind(1-2), wind, gravity), update, display, checksides
  for (int i=0 ; i < lovers.length; i ++) {

    //____________________________FRICTION_______________________
    // 1. ______CALCULATING FRICTION:
    //    mew = 0;  //Coefficient of Friction for a given surface:  how much friction in this world
    //    float N = 1; // gravitational force perpendicular to velocity vector
    //    float frictionMag = N * mew;  // magnitude of friction given oil on the moon vs oil on earth
    //    PVector friction = lovers[i].velocity.get();  // be sure to get initial friction based on initial velocity
    //    friction.mult(-1);  // according to the equation -1 * mew * N * ||v||
    //    friction.normalize();
    //    friction.mult(frictionMag);

    //2. ______APPLY FRICTION:
    //lovers[i].applyforce (friction);   //  <-----------------apply FRICTION to each object
    //___________________________________


    //________  OTHER WIND OF VARIOUS ELEVATIONS_______________________ 
    if ((lovers[i].location.y > height/4) && (lovers[i].location.y < height/2)) {
      lovers[i].applyforce(otherwind);
    }
    if (lovers[i].location.y > height/1.5f) {
      lovers[i].applyforce(otherwind2);
      // lovers[i].applyforce(friction);  // put friction inside of of otherwind area
    }

    //________________________________


    //______APPLY REMAINING FORCES_____
    lovers[i].applyforce (wind);
    lovers[i].applyforce (gravity);

    //_____UPDATE and DISPLAY
    lovers[i].update();
    lovers[i].display();  //moving the display function ABOVE Liquid[].forLoops gets Lovers to change color

    // ___CheckSides and CheckSpeed
    lovers[i].checksides();
    lovers[i].checkspeed();
    lovers[i].renderVectors(); //function for checking keypressed and return functio to drawVector

    // SEND Each lovers[] to EACH attractors[] (except MOUSE ATTRACTOR and RETURN GravForce -> Nested ForLoop
    for (int j= 0; j<attractors.length; j++) {
      if (j !=0) {  // calc grav each attractor (except MOUSE ATTRACTOR) has on each lover
        PVector f = attractors[j].calcGravForce(lovers[i]);  //function to send each Lover to attractor class
        lovers[i].applyforce(f);  // function in attractor class returns PVector f and applies it to each
        
   
        if (showVectors) {
          // if (key == 'a') {
          // drawVector (f, lovers[i].getLoc(), 400);
        }
      }

      else {  //if attractor[0] MOUSE ATTRACTOR, then use THIS function for calc grav at mouse location to all LOVERS
        PVector f = attractors[0].calcGravForceMouse (lovers[i]);
        lovers[i].applyforce(f);
        if (showVectors) {
          //  drawVector (f, lovers[i].getLoc(), 200);  // Draw gravitational force VECTORS
        }
      }
      if (showVectors) {
        drawVector (lovers[i].getVel(), lovers[i].getLoc(), 20); //Draw VELOCITY VECTORS
      }
    }

    // SEND Each lovers[] to each lovers[]
    for (int j =0;j<lovers.length; j++) {
      if (j !=0) {  // calc grav for each lover  except itself
        PVector f = lovers[j].calcGravForce(lovers[i]);
       // lovers[i].applyforce(f);
        //if (showVectors){

        //drawVector (f, lovers[j].getLoc(), 400);
      }
    }

    /*___________________DRAG________________
     _______Appl DRAG to every lovers[] that moves through any liquids[] -> Nested ForLoop 
     --constantly asking boolean to return true */
    for (int j =0; j< liquids.length; j++) {
      if (liquids[j].contains(lovers[i])) {
        PVector drag = liquids[j].drag(lovers[i]);
        lovers[i].applyforce(drag);
        lovers[i].display2(); // display2() changes the color of object as it moves through liquid
      }
    }
  }
}


public void mousePressed() {
  repel = !repel;
}

public void drawVector(PVector v, PVector loc, float scayl) {
  if (v.mag() > 0.0f) {
    pushMatrix();
    float arrowsize = 4;
    // Translate to location to render vector
    translate(loc.x,loc.y);
    stroke(255);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0,0,len,0);
    line(len,0,len-arrowsize,+arrowsize/2);
    line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  }
}

class Lover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float topseed;
  float diameter;
  float drawVectorSize;
float G; // gravitational constant since now each attracts each

  Lover(float _x, float _y, float m, float t, float _s, float _G) { //loc.x,loc.y,mass,topspeed,drawVectorSize
    location = new PVector(_x, _y);
    velocity = new PVector(0,0);
    acceleration = new PVector (0,0);
    mass = m;
    topspeed = t;
    diameter = 3*mass;
    drawVectorSize = _s;
    G = _G;
    //fill (255,0,0);
  }

  // these functions refer to requests from attractor class for calcForceGravity
  public PVector getLoc() {
    return location;
  }

  public PVector getVel() {
    return velocity;
  }
  public float getMass() {
    return mass;
  }


  public void applyforce (PVector force) {
    PVector f = PVector.div(force, mass);
    //PVector f = force.get();  // use non-static version of the force
    //f.div(mass);
    acceleration.add(f);
    if (showVectors) {
      drawVector(force, location, drawVectorSize);
    }
  }
  
  //caculate and return the force that each object has on all other LOVER objects (como attractor)
  //____CALCULATE AND RETURN GravForce
  public PVector calcGravForce (Lover love) {
    // -----MOUSE CONTROL-------
    //PVector mouse = new PVector(mouseX, mouseY);
    //PVector force = PVector.sub(mouse,love.getLoc());  // get distance and magnitude PVector then 
    // regular center located mass
    PVector force = PVector.sub(location,love.getLoc());  // get distance and magnitude PVector then 
    float distance = force.mag();
    distance = constrain(distance,5.0f,25.0f);
   float gravityStrength = (G * mass * love.getMass()) / (distance * distance);  // ATTRACTION GRAVITY
   if (repel) {
     gravityStrength = gravityStrength * -1;
   }

    
    force.normalize();
    force.mult(gravityStrength);  // attractive force
    //force.div(gravityStrength);  // can we divide here to make a repelling force?  ANS: NOPE (dividing with amplify
    return force;
  }


  public void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  

  public void display() {  // Normal non drag action vs display2()
    //normalize location.y and use to make diameter small or bigger
    PVector d = location.get();
    float diam = d.y/height;
    println(diam);

    stroke(0);
    fill(255,0,0);
    ellipse (location.x, location.y, diameter, diameter);
  }
  //________getting the circle to change color when in liquid
  public void display2() {   // for drag action -> color change
    stroke (255);
    fill(0,255,255);
    ellipse (location.x, location.y, diameter, diameter);
  }

public void renderVectors() { //place function in Lover class that will turn on and off draw vectors
  //if (showVectors) { //attached to the boolean that is toggled by keystroke
  //  drawVector(velocity,location,20);
  //}
}

  
  public void checksides() {
    if (location.x > width-(diameter)/2) {
      velocity.x = velocity.x * -1;
      location.x=width -(diameter)/2;
      //location.x = 0;
    }
    if (location.x <(diameter)/2) {
      velocity.x= velocity.x* -1;
      location.x=(diameter)/2;
      // location.x = width;
    }
    if (location.y >height-(diameter)/2) {
      velocity.y = velocity.y * -1;
      location.y= height-(diameter)/2;
      //location.y = 0;
    }
    if (location.y < (diameter)/2) {
      velocity.y = velocity.y *-1;
      location.y=(diameter)/2;
      // location.y = height;
    }
  }

  public void checkspeed() {
    float speed = velocity.mag();
    if (speed > topspeed) {
      velocity.normalize();
      velocity.mult(topspeed);
    }
  }
}




// add the big bad attractor class
// for now it's a simple attractor that doesn't move

// how do I turn this information into a force that I can apply to the mover objects?
// F =  (G*m1*m2) / (distance * distance)
/* ANS:  by creating a function in the Attractor Class the 
 1.  receives a mover object  AND
 2.  returns a PVector ATTRACTION force to be passed on to the Mover objects applyforce function.
 */

// How do we receive a mover object?        


class Attractor {  
  PVector loc;
  // PVector vel;  
  // PVector acc;
  float mass;
  // float topspeed;
  float G; //gravitational constant;

  //  For later use when the attractor is moving
  //  Attractor(PVector _loc, float _m) { 
  //    loc = _loc.get();
  //    vel = _vel.get();
  //    acc = _acc.get();
  //    mass = _m;
  //  }

  Attractor (PVector _loc, float _m, float _G) {
    loc = _loc.get(); // standard centered located mass
    //loc = new PVector(mouseX,mouseY);
    mass = _m;
    G = _G;
  }


  //____CALCULATE AND RETURN GravForce
  public PVector calcGravForce (Lover love) {
    // -----MOUSE CONTROL-------
    //PVector mouse = new PVector(mouseX, mouseY);
    //PVector force = PVector.sub(mouse,love.getLoc());  // get distance and magnitude PVector then 
    // regular center located mass
    PVector force = PVector.sub(loc,love.getLoc());  // get distance and magnitude PVector then 
    float distance = force.mag();
    distance = constrain(distance,5.0f,25.0f);
    float gravityStrength = (G * mass * love.getMass()) / (distance * distance);
    force.normalize();
    force.mult(gravityStrength);
    return force;
  }

//_____ADDING another PVector calcGravForce function specifically for the mouse controlled mouse
public PVector calcGravForceMouse (Lover love) {
    // -----MOUSE CONTROL-------
    PVector mouse = new PVector(mouseX, mouseY);
    PVector force = PVector.sub(mouse,love.getLoc());  // get distance and magnitude PVector then 
    // regular center located mass
    //PVector force = PVector.sub(loc,love.getLoc());  // get distance and magnitude PVector then 
    float distance = force.mag();
    distance = constrain(distance,5.0f,25.0f);
    float gravityStrength = (G * mass * love.getMass()) / (distance * distance);
    force.normalize();
    force.mult(gravityStrength);
    return force;
  }

// ________ADDING another PVector calcGravForce fucntion for Mouse attractor on ships
public PVector calcGravForceMouse (ShiffmanShip ship) {
    // -----MOUSE CONTROL-------
    PVector mouse = new PVector(mouseX, mouseY);
    PVector force = PVector.sub(mouse,ship.getLoc());  // get distance and magnitude PVector then 
    // regular center located mass
    //PVector force = PVector.sub(loc,love.getLoc());  // get distance and magnitude PVector then 
    float distance = force.mag();
    distance = constrain(distance,5.0f,25.0f);
    float gravityStrength = (G * mass * ship.getMass()) / (distance * distance);
    force.normalize();
    force.mult(gravityStrength);
    return force;
  }
  
   //____CALCULATE AND RETURN GravForce of attractors on ships
  public PVector calcGravForce (ShiffmanShip ship) {
    // -----MOUSE CONTROL-------
    //PVector mouse = new PVector(mouseX, mouseY);
    //PVector force = PVector.sub(mouse,love.getLoc());  // get distance and magnitude PVector then 
    // regular center located mass
    PVector force = PVector.sub(loc,ship.getLoc());  // get distance and magnitude PVector then 
    float distance = force.mag();
    distance = constrain(distance,5.0f,25.0f);
    float gravityStrength = (G * mass * ship.getMass()) / (distance * distance);
    force.normalize();
    force.mult(gravityStrength);
    return force;
  }

  // method to display
  public void display () {
    stroke (0);
    fill(255);
    ellipse(loc.x, loc.y, mass*2, mass*2);
  }

  public void mouseControlled () {
    stroke (0);
    fill(0,0,255);
    ellipse(mouseX, mouseY, mass*2, mass*2);
  }
}



/* Liquid class
 where liquid is an area of increased drag
 
 DRAG = -1 * Cd * speed * speed
 (1) dynamic force 
 (2) opposite the direction of velocity and 
 (3) directly proportional to the speed of the object
 
 where drag is a force in opposite direction (-1)
 multiplied by the Coefficient of Drag (Cd):  the constant representing the viscosity of the medium
 multiplied by Velocity Squared (speed * speed):  less drag at slower speeds, exponential increase.
 
 */


class Liquid { 
  float x;  // x location of drag box
  float y;
  float w;
  float h;  // width and height of this drag box
  float Cd;  // Coefficient of drag
  float vel = 1;

  Liquid (float _x, float _y, float _w, float _h, float _Cd) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    Cd = _Cd;  // Coefficient of DRAG
  }

  // LIQUID FUNCTIONS:  // these functions contain RETURNS, which is why it's not VOID Function
  // use a conditional to determine if the moving object LOVER is inside the liquid
  public boolean contains(Lover m) {
    PVector loc =m.location;
    // is Lover object is inside of mouse controlled fluid?
    //    if (loc.x> mouseX && loc.x < mouseX + w  && loc.y > mouseY && loc.y < mouseY+ h) {  //creates flyover
    //     return true;
    //  } 
    // is Lover object inside of stationary fluid area? Yes? then go back to if statement and apply force
    if (loc.x> x && loc.x < x + w  && loc.y > y && loc.y < y+ h) {
      return true;
    } 
    // No?  then return fals and do not apply drag force
    else {
      return false;
    }
  }
  
  // liquid function for importing ships
   public boolean contains(ShiffmanShip ship) {
    PVector loc =ship.location;
    // is Lover object is inside of mouse controlled fluid?
    //    if (loc.x> mouseX && loc.x < mouseX + w  && loc.y > mouseY && loc.y < mouseY+ h) {  //creates flyover
    //     return true;
    //  } 
    // is Lover object inside of stationary fluid area? Yes? then go back to if statement and apply force
    if (loc.x> x && loc.x < x + w  && loc.y > y && loc.y < y+ h) {
      return true;
    } 
    // No?  then return fals and do not apply drag force
    else {
      return false;
    }
  }

  /* ----DRAG FUNCTION that:
   1. takes in a Moving Object's Info
   2. Uses Object's info to calculate the Drag Vector (Magnitude and Direction)
   3. Returns Drag PVector for application to that object
   
   
   --- Drag Formula:  [-1 * Coefficient of drag * speed * speed] ---
   
   --Creating Drag Force from Moving Object's Information: [CONCEPT]
   1. first remove the direction from Velocity vector and use it's magnitude to solve drag formula
   2. then remove the velocity's magnitude and use it's direction so the drag force knows which way to go
   
   ----How to create a Drag Force from a Moving Object's Information
   1. Find Drag Magnitude:
   1a. Find Speed of moving object from the magnitude of Object's velocity Vector
   1b. Apply Speed to Drag Formula and Solve for Drag Amount [Drag Magnitude]. Save it in float variable
   2. Find Drag Direction:
   2a. Create the "Drag" vector and set it equal to the moving object's velocity using the .get() function
   2b. Normalize this new Drag Vector (previously Velocity) to remove Magnitude and derive DIRECTION
   3. Calculate Drag Force by Multiplying it's Direction (from 3) by it's Magnitude (from 1)
   4. Return the Drag Force to main program for it's application to the moving object
   
   */

  public PVector drag(Lover m) {
    // 1. Find Drag Magnitude
    float speed = m.velocity.mag(); // 1.
    float dragMagnitude = -1 * Cd * speed * speed;  // 2.

    // 2. Find drag direction:  derived from unit vector of velocity
    PVector drag = m.velocity.get(); // 2a. Create Drag Vector
    drag.normalize(); //2b. Derive Drag's Direction

    // 3. Calculate Drag's Force Vector (magnitude and direction)
    drag.mult(dragMagnitude);

    // 4. Return the new Drag Vector to main program
    return drag;
  }
  
  // FUNCTION for importing ships to the drag calculation of the liquid class
  public PVector drag(ShiffmanShip ship) {
    // 1. Find Drag Magnitude
    float speed = ship.velocity.mag(); // 1.
    float dragMagnitude = -1 * Cd * speed * speed;  // 2.

    // 2. Find drag direction:  derived from unit vector of velocity
    PVector drag = ship.velocity.get(); // 2a. Create Drag Vector
    drag.normalize(); //2b. Derive Drag's Direction

    // 3. Calculate Drag's Force Vector (magnitude and direction)
    drag.mult(dragMagnitude);

    // 4. Return the new Drag Vector to main program
    return drag;
  }

  public void display () {
    fill (200,0,200,100);
    rect(x,y,w,h);

  }
  public void update () { // for Mouse Controlled Liquid Area
    fill (175);
    rect(mouseX,mouseY,w,h);
  }
}

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
  public PVector getLoc() {
    return location;
  }

  public PVector getVel() {
    return velocity;
  }
  public float getMass() {
    return mass;
  }


  // Standard Euler integration
  public void update() { 
    velocity.add(acceleration);
    velocity.mult(damping);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  // Newton's law: F = M * A
  public void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass); // ignoring mass right now
    acceleration.add(f);
  }

  // Turn changes angle
  public void turn(float a) {
    heading += a;
  }

  // Apply a thrust force
  public void thrust() {
    // Offset the angle since we drew the ship vertically
    float angle = heading - PI/2;
    // Polar to cartesian for force vector!
    PVector force = new PVector(cos(angle),sin(angle));
    force.mult(5); // original shiffman code =.5
    applyForce(force); 
    // To draw booster
    thrust = true;
  }

  public void wrapEdges() {
    float buffer = r*2;
    if (location.x > width +  buffer) location.x = -buffer;
    else if (location.x <    -buffer) location.x = width+buffer;
    if (location.y > height + buffer) location.y = -buffer;
    else if (location.y <    -buffer) location.y = height+buffer;
  }


  // Draw the ship
  public void display() { 
   
    
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
  
  public void display2() { 
   
    
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

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "sketch_mar8a_Asteroids_II" });
  }
}
