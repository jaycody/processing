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

public class sketch_sep18b_EqualSeekersOfInteraction extends PApplet {

// Jason Stephens
// Introduction To Computational Media (ICM)
// Week:2_Project:2_ Equal Seekers of Interaction
// ITP - Fall 2010
// 1_Declared x and y as int variables and assigned values 
// 2_used the Find and Replace tool to find each instance of top right vertes and replaced with x,y (even the declared 580)
// 3_repeated line 2 for c and d
// 4_experimented with changing c d values
// 5_differentiated all inner pentagon vertices, declared a-j as int variables and assigned to each vertex.
// 6_experimented with manually changing values for variable
// 7_NEXT:  want to place mouse coordinates into one vertex...
// 7.1_NEXT:  want to affect small pentagon with a percentage of the change larger pentagon
// 8_NOTE:  find and replace tool indiscriminately changed ALL.  look for "c" where there would otherwise be an "x" como experiment
// 9_declare global varialbes first, then create programing blocks for setup and draw.
// 10_now that the draw is running in a continuous loop, I can use the mouse to affect some change....
// 11_time to start messsing with the variable stokeWeight using dist(), mouseX, mouseY, pmouseX, pmouseY

//Declaring Global Variables
int a = 412; //original value 412
int b = 200; //original value 200
int c = 580; //original value 580
int d = 175; //original value 175
int e = 580; //original value 175
int f = 300; //original value 300
int g = 480; //original value 480
int h = 400; //original value 400
int i = 380; //original value 380
int j = 300; //original value 300

//creating setup() Block
public void setup() {
  size(1028,764);
  background(0);
  smooth();
}

//create draw() block
public void draw() {

  //force a redraw, otherwise the image covers itself up
  //background(0);
  
  //mouseX and Y for crazy variables like....
  stroke(0,100);
  float weight = dist(mouseX,mouseY,pmouseX,pmouseY);// making the stroke weight relative to the distance moved
  strokeWeight(weight);

  strokeWeight(10);
  fill(255,50);
  ellipse(mouseX,mouseY,75,75);

  //Circular Logic at the Vertices (the green ones underneath)
  strokeWeight(8);
  stroke(0);
  fill(0,200,0);
  ellipseMode(CORNER);
  ellipse(e,f,50,50);//right lower
  ellipse(a,b,75,75);//left top
  ellipse(i,j,100,100);//left lower
  ellipse(g,h,120,120);//bottom
  ellipse(c,d,150,150);//right top BIG
  //ellipse(mouseX, mouseY, 150, 150);//right top big NOW UNDER MOUSE CONTROL!!

  //repositioning large circle
  ellipseMode(CENTER);
  stroke(255);
  strokeWeight(2);
  fill(255,0,0);
  strokeJoin(ROUND);
  ellipse(c,d,150,150); //large red circle top right underneath
  ellipse(e,f,50,50);
  ellipse(a,b,75,75);
  ellipse(i,j,100,100);
  ellipse(g,h,120,120);

  //Connecting The Points around the star
  //stroke(0,255,0);
  //strokeWeight(3);
  //line(50,250,512,50); //Top Left Line
  //line(50,250,225,600); //Bottom Left Line
  //line(225,600,990,730); //bottom line
  //line(990,730,950,150); //right line
  //line(950,150,512,50);  //top right line
  
   //this mouse controlled ellipse is seemingly blocking the center
  stroke(0,100);
  strokeWeight(17);
  fill(0.100f);
  ellipse(mouseX/2 + 250,mouseY/2 + 150,mouseX/3,mouseY/3);

  //The 5 pointed star: or how I learned to join 5 triangles
  //stroke(255);
  //strokeWeight(8);
  //fill(0,0,255,100);
  point(512,50);
  point(a,b);
  point(c,d);
  
  //blue triangles stationary
  //stroke(255);
  //strokeWeight(8);
  //fill(0,0,255,100);
  //triangle(512,50,a,b,c,d);  //top tri : original value of outter most point 512,50
  //triangle(a,b,i,j,50,250); //left tri
  //triangle(i,j,g,h,225,600);  //bottom left tri
  //triangle(g,h,990,730,e,f);  //bottom right
  //triangle(e,f,c,d,950,150);  //top right
  
   //Connecting The Points around the star:  Big green lines that FOLLOW WIH MOUSE
  stroke(0,255,0,50);
  strokeWeight(weight/10);
  line(mouseX,mouseY-300,mouseX-500,mouseY-100); //Top Left Line
  line(mouseX-500,mouseY-100,mouseX-512,mouseY+500); //Bottom Left Line
  line(mouseX-512,mouseY+500,mouseX+500,mouseY+350); //bottom line
  line(mouseX+500,mouseY+350,mouseX+550,mouseY-150); //right line
  line(mouseX+550,mouseY-150,mouseX,mouseY-300);  //top right line
  
  //blue triangles following the mouse
  stroke(0);
  strokeWeight(weight);
  fill(0,0,255,100);
  triangle(mouseX,mouseY-300,a,b,c,d);  //top tri : original value of outter most point 512,50
  triangle(a,b,i,j,mouseX-500,mouseY-100); //left tri
  triangle(i,j,g,h,mouseX-512,mouseY+500);  //bottom left tri
  triangle(g,h,mouseX+500,mouseY+350,e,f);  //bottom right
  triangle(e,f,c,d,mouseX+550,mouseY-150);  //top right

  //repositioning large circle
  ellipseMode(CENTER);
  stroke(255);
  fill(255,0,0);
  strokeJoin(ROUND);
  noFill();
  ellipse(c,d,150,150); //large red circle top right underneath
  ellipse(e,f,50,50);
  ellipse(a,b,75,75);
  ellipse(i,j,100,100);
  ellipse(g,h,120,120);

  //Points for the inner vertices
  stroke(255,255,0);
  strokeWeight(4);
  point(a,b);//top left
  point(c,d);//top right
  point(i,j);//bottom left
  point(g,h);//bottom
  point(e,f);//bottom right
  line(a,b,e,f);//line from top left to bottom right
  line(e,f,i,j);//line from bottom right to btm left
  line(i,j,c,d);//line btm left to top right
  line(c,d,g,h);//line top right to bottom
  line(g,h,a,b);//bottom to top left

  //Circular Logic at the Vertices:  you know, the green ones on top
  strokeWeight(weight);//original value 4
  stroke(0);
  fill(0,200,0);
  ellipse(e,f,20,20);//original value 20
  ellipse(a,b,25,25);
  ellipse(i,j,30,30);
  ellipse(g,h,40,40);
  ellipse(c,d,50,50);

  //line between vertices inside small pentagon
  stroke(0,255,0);
  strokeWeight(weight/4);
  line(50,750,112,500);
  line(112,500,d,750);
  line(d,750,5,600);
  line(5,600,225,600);
  line(225,600,50,750);

  //We don't need no stinking ARCHES:  making the bottom left pentagon
  fill(255,0,0,100);
  stroke(255);
  strokeWeight(weight/10);
  beginShape();//start the pentagon
  vertex(225,600);//right top
  vertex(175,750);//right bottom
  vertex(50,750);//left bottom
  vertex(5,600);//left top
  vertex(112,500);//top
  endShape(CLOSE);
  
   //mouseX and Y for crazy variables like....
  stroke(255,0,255);
  fill(255,0,255);
  strokeWeight(weight);
  line(mouseX,mouseY,pmouseX,pmouseY);//the pmouse stores info about previous position then draws line!
  ellipse(mouseX,mouseY,40,40);
  stroke(0);//line from pmouse colored and opacity
  line(mouseX,mouseY,pmouseX,pmouseY);//the pmouse stores info about previous position then draws line!
  strokeWeight(weight);
  
  //Print a line so I know the program is running
  println("\0/");
  println(" 0 ");
  
}









  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "sketch_sep18b_EqualSeekersOfInteraction" });
  }
}
