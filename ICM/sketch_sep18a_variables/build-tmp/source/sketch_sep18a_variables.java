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

public class sketch_sep18a_variables extends PApplet {

//Jason Stephens
//ICM Fall 2010 - ITP
//wk 2 - Variables
//Declaring Global Variables
//setup and draw
//for loops
//using mouse clicks and input

public void setup ()
{
  size (1024,768);  //establishing screen size
  background(0);  //background color
  smooth();
  
  noFill();  //creates empty polygon
  stroke(255); //outline of perimeter
  strokeWeight(8); //width of perimeter stroke
  polygon(5, 500, 300, 275, 275, -PI / 2.0f); // -90 degrees
}

public void polygon(int n, float cx, float cy, float w, float h, float startAngle)
{
  float angle = TWO_PI/ n;

  /* The horizontal "radius" is one half the width;
     the vertical "radius" is one half the height */
  w = w / 2.0f;
  h = h / 2.0f;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + w * cos(startAngle + angle * i),
      cy + h * sin(startAngle + angle * i));
  }
  endShape(CLOSE);
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_sep18a_variables" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
