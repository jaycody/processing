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

public class sketch_oct12d_PIXEL_STATIC extends PApplet {

public void setup(){
  size(500,500);
}

public void draw(){
  background (255);
  
  loadPixels();
  for (int y = 0; y<height; y++){
    for (int x = 0; x<width; x++){
      int loc = x + y * width;
      pixels[loc] = color(random(255),random(255),random(255));
    }
  }
  updatePixels();
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_oct12d_PIXEL_STATIC" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
