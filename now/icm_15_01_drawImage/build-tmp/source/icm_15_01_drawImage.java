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

public class icm_15_01_drawImage extends PApplet {

/* jstephens icm redux

from Learning Processing - Daniel Shiffman
http://www.learningprocessing.com

- Example 15-1: "Hello World" images

Declaring a variable of type PImage, 
    a class available to us from the Processing core library.
*/

PImage icm;
PImage neek;


public void setup() {
	size(640,480);
	icm = loadImage("icm.png");
	neek = loadImage("neek.png");
}


public void draw() {
	image(icm,0,0);
	image(neek, mouseX, mouseY);

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "icm_15_01_drawImage" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
