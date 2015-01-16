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

public class icm_15_02_imageSprite extends PApplet {

/* jstephens icm redux

from Learning Processing - Daniel Shiffman
http://www.learningprocessing.com

- exercise 15-2: image Sprite

Declaring a variable of type PImage, 
    a class available to us from the Processing core library.
Use variables for position and rotation
*/


PImage neek;
float x;
float y;
float rot;

public void setup(){
	size(640,480);
	neek = loadImage("neek.png");
	x = 100;
	y = 100;
	rot = .5f;
}


public void draw(){
	//translate(x,y);
	rotate(rot);

	image(neek, 0,0,64,48);


	//adjust variables for animation

	rot+=.01f;
	x+=2;
	//y+=1;

	if (x>width+neek.width) {
		x = -neek.width;
	}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "icm_15_02_imageSprite" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
