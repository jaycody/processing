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

public class icm_15_02_02_imageSprite_Class extends PApplet {

/* jstephens icm redux

from Learning Processing - Daniel Shiffman
http://www.learningprocessing.com

- exercise 15-2: image Sprite As Class

Rewrite Example 15-2 in an object-oriented fashion 
where the data for the image, location, size, rotation, and so on
is contained in a class. 
Can you have the class swap images when it hits the edge of the screen?
*/


NeekImage neekObj;

public void setup() {
	size (640,480);
	neekObj = new NeekImage("neek.png", 64, 48, 50, 100, 0.8f);
}


public void draw() {
	
	neekObj.display();
	neekObj.move();
}



class NeekImage {

	PImage 	neek;
	float x;
	float y;
	float w;
	float h;
	float rot;

	NeekImage(String filename, float _x , float _y, float _w, float _h, float _rot) {
		
		//load image an initialize variables
		neek = loadImage(filename);
		x = _x;
		y = _y;
		w = _w;
		h = _h;
		rot = _rot;
	}


	public void display(){
		translate(mouseX, mouseY);
		rotate(rot);
		image(neek, 0, 0, w, h);
	}

	public void move(){
		//x+=1;
		//y+=1;
		rot+=1.1f;

	}
	


}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "icm_15_02_02_imageSprite_Class" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
