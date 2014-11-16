import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_sep26a_circleGrow_circleShrink extends PApplet {

// Jason Stephens
// Introduction To Computational Media (ICM)
// Week:3_Practice_cirlceGrow and shrinking
// ITP - Fall 2010


int circlegrow = 0;
int speed = 1;
int circlegrowX = 100;
int circlegrowY = 100;

public void setup(){
  size(200,200);
  smooth();
  background(0);
}

public void draw(){
  background(0);
  strokeWeight(3);
  stroke(255);
  fill(0);
  ellipse(mouseX,mouseY,circlegrow,circlegrow);
  circlegrow = circlegrow + speed;
  if ((circlegrow > 200) || (circlegrow < 0)) {
    speed = speed * -1;
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_sep26a_circleGrow_circleShrink" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
