import processing.core.*; 
import processing.xml.*; 

import processing.video.*; 

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

public class sketch_dec13a_color_tracking extends PApplet {

// jason stephens
// final project ICM
// fall 2010 - shiffman

// An Intelligent Healing Space (scale model)

/* For this project I placed a miniauturized massage table in the middle of a 4 walled space.  
The space was roughly 2.5feet x 1.5 feet.  The walls were composed of fabric around a frame of plumbing pipe.
A simple dc motor connected to an H-Bridge on an Arduino board was used to control the opening and closing of the fabric curtains.
A pico projector was placed directly over the healing space, pointing straight down on to the massage table and surrounding space.
A webcam, used for simple color tracking, was also placed above the space.  
I used Shiffman's example of color tracking from his text book for the basic structure of the Processing code.  His example 
incorporated the snake example from an earlier chapter.  I borrowed heavily from this as well.  Thank for Shiffman!  I actually considered
calling this piece of code Snake Byte, since I had admittedly "bitten" the code.
I did change the background color of the present mode to black, a feet which was a bit more complicated than I thought it should have been.
I also commented out the load.pixel function so that the camera would continue to see and relate information without the projector projecting the image.
The treshold for color tracking was another parameter I altered as I calibrated the color tracking for light and dark situations.
*/




// Variable for capture device
Capture video;

// for capturing movie of the video feedback
//MovieMaker mm;

 // Save uncompressed, at 15 frames per second
//  mm = new MovieMaker(this, width, height, "drawing.mov");
  
  // Or, set specific compression and frame rate options
  //mm = new MovieMaker(this, width, height, "drawing.mov", 30, 
  //                    MovieMaker.ANIMATION, MovieMaker.HIGH);

// A variable for the color we are searching for.
int trackColor; 

// A Snake variable
Snake snake;

public void setup() {
  size(720,460);
  frame.setBackground(new java.awt.Color(0, 0, 0));
//frame.setBackground(new Color(0,0,0));
  video = new Capture(this,width,height+100,15);
  // Start off tracking for red
  trackColor = color(255,0,0);
  smooth();

  // Initialize the snake
  snake = new Snake(50);
}

public void draw() {
  // Capture and display the video
  if (video.available()) {
    video.read();
  }


  // this elminates the redraw and makes the background transparent
  //video.loadPixels();
  //image(video,0,0);
 //background(0,0,0,255);
  background(0);

  // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord = 500; 

  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      int currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1,g1,b1,r2,g2,b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  if (worldRecord < 75) { 
    // Update the sake's location
    snake.update(closestX,closestY);
  }

  snake.display();
}

public void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  saveFrame("blah.tif");
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Exercise 16-5: Snake Class

class Snake {
  // x and y positions
  int[] xpos;
  int[] ypos;

  // The constructor determines the length of the snake
  Snake(int n) {
    xpos = new int[n];
    ypos = new int[n];
  }

  public void update(int newX, int newY) {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    for (int i = 0; i < xpos.length-1; i ++ ) {
      xpos[i] = xpos[i+1]; 
      ypos[i] = ypos[i+1];
    }

    // Update the last spot in the array with the mouse location.
    xpos[xpos.length-1] = newX; 
    ypos[ypos.length-1] = newY;
  }

  public void display() {
    // Draw everything
    for (int i = 0; i < xpos.length; i ++ ) {
      // Draw an ellipse for each element in the arrays. 
      // Color and size are tied to the loop's counter: i.
      //stroke(0,0,255-i*5);
      stroke(0,0,0,255);
     fill(0,255,0);
      
      //fill(0,255-i*5,0);
      
      //fill(255-i*5);  shiffmans original code
      ellipse(xpos[i],ypos[i],i+5,i+5); 
    }

  }

}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "sketch_dec13a_color_tracking" });
  }
}
