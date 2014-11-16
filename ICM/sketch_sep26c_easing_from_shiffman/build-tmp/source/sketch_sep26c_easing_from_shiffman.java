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

public class sketch_sep26c_easing_from_shiffman extends PApplet {

// Jason Stephens
// ITP - Fall 2010
// Introduction To Computational Media (ICM)
// Week:3_Practice_easing_examplefromShiffmas


float x;
float y;
float targetX, targetY;
float easing = 0.05f;

public void setup()
{
 size(200, 200);
 smooth();
 noStroke();
}

public void draw()
{
 background( 51 );

 //targetX = width-mouseX; //shiffman's example OPPOSISTE
 targetX=mouseX;
 float dx = targetX - x;
 if(abs(dx) > 1) {
   x += dx * easing;
 }

 //targetY = height-mouseY;
 targetY = mouseY;
 float dy = targetY - y;
 if(abs(dy) > 1) {
   y += dy * easing;
 }

 //ellipse(width-mouseX,100, 33, 33);
 ellipse(x, y, 33, 33);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_sep26c_easing_from_shiffman" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
