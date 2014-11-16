import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.pdf.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_dec12b extends PApplet {



public void setup() {
  size(600, 600);
  frameRate(24);
  background(255);
}

public void draw() {
  stroke(0, 20);
  strokeWeight(20.0f);
  line(mouseX, 0, width-mouseY, height);
}

public void mousePressed() {
  beginRecord(PDF, "Lines.pdf"); 
  background(255);
}

public void mouseReleased() {
  endRecord();
  background(255);
}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_dec12b" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
