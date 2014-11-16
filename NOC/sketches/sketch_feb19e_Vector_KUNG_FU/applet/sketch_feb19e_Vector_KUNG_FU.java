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

public class sketch_feb19e_Vector_KUNG_FU extends PApplet {

// jason stephens
// processing kung fu
// nature of code _ PVector Practice

// going to create an object that follows the mouse
// 1. creat a class Healer.
// 2. create the main program


// call on the Healer

Healer jay;

//setup

public void setup(){
  size (400,400);
  background(0);
  
  jay = new Healer ();
}

public void draw(){
  //fill (255,10);
  jay.update();
  jay.render();
  jay.checkedges();
}
// create the Healer class

class Healer {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  //PVector mouse;
 // PVector direction;  // why don't we call these here?
  
  Healer () {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0,0);
    topspeed = 4;
  }
  
  public void update () {
    PVector mouse = new PVector (mouseX, mouseY);
    PVector direction = PVector.sub(location, mouse);  //static version 
    direction.normalize();
    direction.mult(.5f);
    acceleration = direction;
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  public void render () {
    fill (255);
    ellipse (location.x, location.y, 20,20);
  }
  
  public void checkedges () {
    if (location.x >width) {
      location.x = 0;
    }
   else if (location.x < 0 ) {
      location.x= width;
   }
   
   if (location.y > height) {
     location.y = 0;
   }
   else if (location.y<0){
     location.y = height;
   }
      
}
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "sketch_feb19e_Vector_KUNG_FU" });
  }
}
