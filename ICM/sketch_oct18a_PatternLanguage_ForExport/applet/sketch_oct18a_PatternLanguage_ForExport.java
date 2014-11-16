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

public class sketch_oct18a_PatternLanguage_ForExport extends PApplet {

//PImage Pattern Language Performance
/*using 238 images from the Angel Card Library used here as an array of images
from which the random functions select an image for each 5 instances everytime
the mousebutton is pushed.*/


//declaring a variable of type PImage

PImage img;
float x,y;
float rot;
float m;
int numberPicts = 238;
int imageIndex = 0; // initial image to be displayed
int imageIndex2 =50;
int imageIndex3=200;
int imageIndex4=100;

PImage [] images = new PImage[numberPicts];
float t;
float speedT;

public void setup() {
  background(0);
  size(1024,768);
  for(int i=0; i<numberPicts;i++) {

    images [i] = loadImage("unedited" + i + ".png");
  }


      //make new instance of a PImage class by loading an image file
    img = loadImage("unedited0.png");
    x=width/2;
    y=height/2.0f;
    rot=.2f;
    t=0;
    speedT=2;
  }

  public void draw() {
    //background(0);

    translate(x,y);
    rotate(rot);
    //rectMode(CENTER);
    //image(img,m,0,mouseX,mouseY);
    image(images[imageIndex4],5,0,mouseX/2,speedT);
    image(images[imageIndex3],10,10,mouseX*2,mouseY*2);
    image(images[imageIndex2],-10,-10,mouseY,mouseX);
    image(images[imageIndex],0,5,mouseX,mouseY/2);
    image(images[imageIndex4],mouseY/4,mouseX/4,speedT,speedT);
    if(mousePressed==true){
      imageIndex = PApplet.parseInt(random(237));
      imageIndex2= PApplet.parseInt(random(237));
      imageIndex3=PApplet.parseInt(random(237));
      imageIndex4=PApplet.parseInt(random(237));
    }
    //translate and rotate
    //rectMode(CORNERS);
    float m = map(mouseX,0,width,255,100);
    //float d = map(mouseY,0,height,255,0);
    tint(255,255,255,m);
    //image(img,noise(mouseX/7),mouseY/4,mouseX*2,mouseY*2);
t = t + speedT;
if ((speedT>200)||(speedT<0)){
  speedT=speedT*-1;
}
    //adjust variables to create animation
    x+= 0.0f;
   // rot +=8;
   //rot+=10000;
    rot += 10.021f;
    if (x>width) {
      x=0;
    }
  }

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "sketch_oct18a_PatternLanguage_ForExport" });
  }
}
