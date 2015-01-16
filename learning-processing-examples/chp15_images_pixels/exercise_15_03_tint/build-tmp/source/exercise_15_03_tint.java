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

public class exercise_15_03_tint extends PApplet {

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Exercise 15-3: Display an image using tint(). Use the 
// mouse location to control the amount of red, green, 
// and blue tint. Also try using the distance of the 
// mouse from the corners or center.


// Declaring a variable of type PImage, a class available to us from the Processing core library.
PImage img; 

public void setup() {
  size(320, 240);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("mysummervacation.jpg");
}

public void draw() {
  background(0);

  float r = map(mouseX, 0, width, 0, 255);
  float g = map(mouseY, 0, height, 0, 255);

  float d = dist(mouseX, mouseY, width/2, height/2);
  float b = map(d, 0, width/2, 0, 255);

  tint(r, g, b);

  image(img, 0, 0);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "exercise_15_03_tint" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
