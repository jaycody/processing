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

public class sketch_jan27a_wk1_ProbabilityWalkers extends PApplet {

//  Jason Stephens
//  Nature of Code
//  Probability Walkers
//  Exploring various techniques for informing the random function
//  Random - Guassian - Monte Carlo - Perlin Noise


//  1.  build a random walker class
//  2.  build a GuassianWalker class
//  3.  build a MonteCarloWalker class
//  4.  build a PerlinNoiseWalker class

// create instances of each class

//RandomWalker rw;
GuassianWalker gw;
//MonteWalker mw;
PerlinWalker pw;
BallWalker bw;
BrownianWalker brw;

public void setup() {
  size (400,400);
  frameRate(30);
  background(0);
  
  // create a RandomWalker Object
  //rw = new RandomWalker();
  
  // create a GuassianWalker Object
  gw = new GuassianWalker();
  
  // create an instance of the MonteWalker
 // mw = new MonteWalker();
  
  // create an instance of the PerlinWalker
 pw = new PerlinWalker();
  
  // create an instance of BallWalker
  bw = new BallWalker();
  
  //creat an instance of Brownian Walker
  brw = new BrownianWalker ();
  
}

public void draw() {
  //background (0);
  
   // render the Brownian object
  //brw.render();
  
   // render the Ballkwalker object
  //bw.render();
  
  // run the walker object
 // rw.walk();
 // rw.render();
  
  // run the GuassianWalker object
// gw.render();
// gw.walk();
// gw.bounce();
  
  // render the MonteWalker Object
 // mw.render();
  
  // render the PerlinWalker object
 pw.render();
  pw.walk();
   pw.render();
  pw.walk();
   //pw.render();
  //pw.walk();
  
  // render the Ballkwalker object
  bw.render();
  bw.walk();
   bw.render();
  bw.walk();
   //bw.render();
  //bw.walk();
  

}




// create Brownian Walker Class

// the following code comes from Processing examples

class BrownianWalker {
  
  int num = 2000;
  //int range = int(random(10,19));

  float[] ax = new float[num];
  float[] ay = new float[num];

  BrownianWalker() 
  {
    for (int i = 0; i<num; i++) 
    {
      ax[i] = width-width/4;
      ay[i] = height-height/4;
    }
  }

    public void render ()
    {
      int range = PApplet.parseInt(random(1,20));
      // shift all elements 1 place to the left
      for(int i = 1; i<num; i++) {
        ax[i-1] = ax[i];
        ay[i-1] = ay[i];
      }
      
      //put a new value at the end of the array
      ax[num-1] +=random (-range, range);
      ay[num-1] +=random (-range, range);
      
//      ax[num-1] +=random (-range, range);
//      ay[num-1] +=random (-range, range);
      
      //constrain all points to the screen
      ax[num-1] = constrain(ax[num-1],0,width);
      ay[num-1] = constrain(ay[num-1],0,height);
      
      
      // draw a line connecting the points
      
      for (int i=1; i<num; i++) {
        float val = PApplet.parseFloat(i)/num *204.0f +51;
        stroke(val);
        line(ax[i-1], ay[i-1], ax[i], ay[i]);
      }
    }
}
      

// write a standard ball class with bounce and gravity


class BallWalker {

  float x, y, a;
  float vx = 2;
  float gravityX = 3;
  float vy = 1;
  float gravityY = .03f;
  // gravity is acceleration in the y axis
  // using standard physics abbeviations

  // Constructor

  BallWalker()
  {
    x = (width/2);
    y = (height/2);
  }

  public void render ()
  {
    stroke(0);
    fill(255,255,0);
    rectMode(CENTER);
    ellipse(x, y, 10,10);
  }

  public void walk () { // random fall constraining random function

    // vertical component of velocity
    y = y+vy;
    vy = vy+gravityY;

    if (y>height +25) {
      y = -25;
      vy=1;
    }



    x = x+vx;
    if ((x>random(width/2,width)) && (vx>0)) {
      vx = vx * -1; 
      //gravityX = gravityX * -1;
    }

    if ((x<random(0,width/2)) && (vx < 0)) {
      vx = vx * -1;
      //gravityX=gravityX * -1;
    }

    //  if (vx < 0 ) {
    //    x = vx + gravityX;
    //  }
    //  if (vx > 0) {
    //    x = vx -gravityX;
    //  }
    //vx = vx + gravityX;
    //if (gravityX>1)
    //gravityX = gravityX*-1;
//    print("gravityX = ");
//    print(gravityX);
//    print("  y = ");
//    println(y);
  }
}

// build the GuassianWalker class
// Guassian or "normal" bell curve distribution
/* demonstrate Guassian probabilities by modeling
a single drop of water in a water fountain.  
*/

class GuassianWalker {
  
  float x,y;
  
  GuassianWalker() {
    x = width/4;
    y = height/4;
  }
  
  public void render () {
    fill (0,255,0);
    rectMode(CENTER);
    rect(x,y, 10,10);
    
  }

public void walk (){
  float vx = random(-5,5);
  float vy = random(-5,5);
  
    x+= vx;
    y+= vy;
}
public void bounce () {
  if ((x>width) || (x<0))
  x = x * -1;
  
  if ((y>height) || (y<0))
  y = y * -1;
}
}
 



////  build the Monte Carlo Walker class (aka MonteWalker class)
///* 1. Define a domain of possible inputs.
//   2. Generate inputs randomly from the domain using a certain specified probability distribution.
//   3. Perform a deterministic computation using the inputs.
//   4. Aggregate the results of the individual computations into the final result.
//*/
//
//
//class MonteWalker {
//  
//  float x, y;
//  float vx;
//  float gx;
//  float vy;
//  float gy;
//  float ax;
//  float ay;
//  
//  
//  MonteWalker() {
//    x = width-width/4;
//    y = height-height/4;
//  }
//  
//  void render () {
//    fill(0,0,255);
//    // what happens if I don't put fill or rectMode information
//    ellipse(x+30,y+30,10,10);
//  }
//  
//  void walk (){
//    
//}
//
//

//// build the PerlinWalker class
//
//class PerlinWalker {
//  
//  float x,y;
//  
//  PerlinWalker() {
//   
//    x = width/2;
//    y = height/2;
//    
//  }
//  
//  void render () {
//    fill (255,0,255);
//   rectMode(CENTER);
//    rect(x-50,y-50, 40,20);
//    }
//    
//}

//class PerlinWalker {
//
//  float xoff = 30;
//  float yoff = 20;
//
//  void render() 
//  {
//    //background(204);
//    stroke(255);
//
//    fill(255);
//    xoff = xoff + .01;
//    float nx = noise(xoff) *width;
//    float ny = noise(yoff) *height;
//    line(nx, 0, nx,height);
//  }
//  float noiseScale=0.02;
//  void walk() {
//    //background(0);
//    for(int x=0; x < width; x++) {
//      float noiseVal = noise((mouseX+x)*noiseScale, 
//      mouseY*noiseScale);
//      stroke(noiseVal*255);
//      line(x, mouseY+noiseVal*80, x, height);
//    }
//  }
//}

class PerlinWalker {

  float x, y, a;
  float vx = 2;
  float gravityX = 3;
  float vy = 1;
  float gravityY = .03f;
  float boundry;
  float boundryOff = 0;
  float boundry2;
  float boundryOff2 = 0;
  // gravity is acceleration in the y axis
  // using standard physics abbeviations

  // Constructor

  PerlinWalker()
  {
    x = (width/4);
    y = (height/4);
    boundry = width/2;
  }

  public void render ()
  {
    stroke(0);
    fill(255,0,255);
    rectMode(CENTER);
    ellipse(x, y, 10,10);
  }

  public void walk () { // random fall constraining random function

    // vertical component of velocity
    y = y+vy;
    vy = vy+gravityY;

    if (y>height +25) {
      y = -25;
      vy=1;
    }

    // using Perlin noise to constrain falling bounce
    x = x + vx;
    //boundryOff =.8;  // why is the noise always the same here if boundryOff remains constant

    //boundry = noise(boundryOff) * width/2;

    if ((x>boundry) && (vx>0)) {  //trick learned with arduino buttons, only flip states if its an opposite state
      vx = vx * -1; 
      boundry = noise(boundryOff) * width/2;  // if exceeds the boundry, then repopulate boundry, but only then, not before
      boundryOff = boundryOff + .8f;
      //gravityX = gravityX * -1;
    }
    
      if ((x<boundry) && (vx<0))
    {
      vx = vx * -1;
      boundry = noise(boundryOff) * width/2;
      //boundryOff = boundryOff + .8;
      //if ((x<random(0,width/4)) && (vx < 0)) {
    }


//    if ((x<boundry2) && (vx<0))
//    {
//      vx = vx * -1;
//      boundry2 = noise(boundryOff2) * width/4;
//      boundryOff2 = boundryOff2 + .8;
//      //if ((x<random(0,width/4)) && (vx < 0)) {
//    }


    // using random to constrain falling bounce
    //    x = x+vx;
    //    if ((x>random(width/4,width/2)) && (vx>0)) {
    //      vx = vx * -1; 
    //      //gravityX = gravityX * -1;
    //    }
    //
    //    if ((x<random(0,width/4)) && (vx < 0)) {
    //      vx = vx * -1;  
    //    }




    print("boundry = ");
    print(boundry);
    print("  boundryOff = ");
    println(boundryOff);
  }
}

///* the first of several classes for this assignment
// RandomWalker */
//
//
//// now let's see how do we create a CLASS?
//
//class RandomWalker {
//
//  float x,y;
//
//  RandomWalker() {
//    x = width/2;
//    y = height/2;
//  }
//
//  void render() {
//    stroke(0);
//    fill(255,0,0);
//    rectMode(CENTER);
//    ellipse(x,y,40,40);
//  }
//  
//  
//  //  Randomly move up, down, left, right, or stay in one place
//  void walk() {
//    float vx = random(-2,2);
//    float vy = random(-2,2);
//    x += vx;
//    y += vy;
//    
//    // Stay on the screen
//    x = constrain(x,0,width-1);
//    y = constrain(y,0,height-1);
//  }
//}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "sketch_jan27a_wk1_ProbabilityWalkers" });
  }
}
