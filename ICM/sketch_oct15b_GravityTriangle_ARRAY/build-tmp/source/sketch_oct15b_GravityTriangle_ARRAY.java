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

public class sketch_oct15b_GravityTriangle_ARRAY extends PApplet {

//// now wittness the firepower of this fully armed and operational ARRAY of Gravity Trianbles
//
//// make and instance of the class GT
//
//GravityTriangle myGT;  //declare "myGT" as an instance of GravityTriangle
//
//int numTriangles = 10;  //declare "numTriangles" variable and initialize it at 100
//
//GravityTriangle[] manyGTs = new GravityTriangle[numTriangles];
//
//
//void setup(){
//  size (1024,1024);
//  
//  //make 100 GravityTriangles and put them in an array
//  
//  for (int i=0;i<manyGTs.length;i++){
//    manyGTs[i] = new GravityTriangle(random(255));// HERE is where the variable gets passed into the object
//  }
//}
//
////now draw every single one of those GTs
//void draw(){
//  background(255);
//  for (int i=0;i<manyGTs.length;i++){
//    manyGTs[i].drawTriangle();
//    //manyGTs[i].drawTrackers();
//  }
//}
//  


//Processing Kung Fu - Do it again, and again and again
//GravityTriangle myGT; // declare new object from the class 
//
//int numTriangles = 20;  // create variable for the number of triangles
//
//GravityTriangle[] manyGTs = new GravityTriangle[numTriangles]; // declare new array of objects from the class
//
//
//void setup(){
//  size (1024,768);
//  //make 100 triangle objects and put each one into the array manyGTs
//  
//  for (int i=0;i<manyGTs.length;i++){
//    manyGTs[i] = new GravityTriangle(random(255));  // loop creating object in each index of array manyGTs
//  }
//}
////now draw every instance from the array
//
//void draw(){
//  background(0);
//  for (int i = 0; i<manyGTs.length; i++){
//    manyGTs[i].drawTriangle();
//  }
//}

//AGAIN

GravityTriangle myGT; //declare the new object from the class

int numberTriangles = 5; // create the length of the array to be created

GravityTriangle[] manyGTs = new GravityTriangle[numberTriangles];

public void setup() {
  size (1200,1200);
  // create n objects and populate each index of the array
  for (int i = 0; i<manyGTs.length; i++) {
    manyGTs[i] = new GravityTriangle(0);
  }
}

public void draw() {
  background (255); //(random(255));
  stroke(0);
  strokeWeight(3);
 // line(manyGTs[manyGTs.length-1].x1,manyGTs[manyGTs.length-1].y1,manyGTs[1].x1,manyGTs[1].y1);
  // strokeWeight(0);
  //stroke(255);
  for (int i=0;i<manyGTs.length; i++) {
    manyGTs[i].drawTriangle();
    manyGTs[i].drawTrackers();
    // line(manyGTs[i].x1,manyGTs[i].y1,manyGTs[manyGTs.length-1].x1,manyGTs[manyGTs.length-1].y1);
   // line(manyGTs[i].x1,manyGTs[i].y1,manyGTs[i].x1,manyGTs[i].y1);
    for (int q=0; q<manyGTs.length;q++) {
      strokeWeight(3);
      stroke(255,0,0);

      line(manyGTs[i].x1,manyGTs[i].y1,manyGTs[q].x1,manyGTs[q].y1);
    }
    strokeWeight(3);
    stroke(0);
  }
}

////// now wittness the firepower of this fully armed and operational ARRAY of Gravity Trianbles
////
////// make and instance of the class GT
////
////GravityTriangle myGT;  //declare "myGT" as an instance of GravityTriangle
////
////int numTriangles = 10;  //declare "numTriangles" variable and initialize it at 100
////
////GravityTriangle[] manyGTs = new GravityTriangle[numTriangles];
////
////
////void setup(){
////  size (1024,1024);
////  
////  //make 100 GravityTriangles and put them in an array
////  
////  for (int i=0;i<manyGTs.length;i++){
////    manyGTs[i] = new GravityTriangle(random(255));// HERE is where the variable gets passed into the object
////  }
////}
////
//////now draw every single one of those GTs
////void draw(){
////  background(255);
////  for (int i=0;i<manyGTs.length;i++){
////    manyGTs[i].drawTriangle();
////    //manyGTs[i].drawTrackers();
////  }
////}
////  
//
//
////Processing Kung Fu - Do it again, and again and again
////GravityTriangle myGT; // declare new object from the class 
////
////int numTriangles = 20;  // create variable for the number of triangles
////
////GravityTriangle[] manyGTs = new GravityTriangle[numTriangles]; // declare new array of objects from the class
////
////
////void setup(){
////  size (1024,768);
////  //make 100 triangle objects and put each one into the array manyGTs
////  
////  for (int i=0;i<manyGTs.length;i++){
////    manyGTs[i] = new GravityTriangle(random(255));  // loop creating object in each index of array manyGTs
////  }
////}
//////now draw every instance from the array
////
////void draw(){
////  background(0);
////  for (int i = 0; i<manyGTs.length; i++){
////    manyGTs[i].drawTriangle();
////  }
////}
//
////AGAIN
//
//GravityTriangle myGT; //declare the new object from the class
//
//int numberTriangles = 5; // create the length of the array to be created
//
//GravityTriangle[] manyGTs = new GravityTriangle[numberTriangles];
//
//void setup() {
//  size (1200,1200);
//  // create n objects and populate each index of the array
//  for (int i = 0; i<manyGTs.length; i++) {
//    manyGTs[i] = new GravityTriangle(0);
//  }
//}
//
//void draw() {
//  background (255); //(random(255));
//  stroke(0);
//  strokeWeight(3);
// // line(manyGTs[manyGTs.length-1].x1,manyGTs[manyGTs.length-1].y1,manyGTs[1].x1,manyGTs[1].y1);
//  // strokeWeight(0);
//  //stroke(255);
//  for (int i=0;i<manyGTs.length; i++) {
//    manyGTs[i].drawTriangle();
//    manyGTs[i].drawTrackers();
//    // line(manyGTs[i].x1,manyGTs[i].y1,manyGTs[manyGTs.length-1].x1,manyGTs[manyGTs.length-1].y1);
//   // line(manyGTs[i].x1,manyGTs[i].y1,manyGTs[i].x1,manyGTs[i].y1);
//    for (int q=0; q<manyGTs.length;q++) {
//      strokeWeight(3);
//      stroke(255,0,0);
//
//      line(manyGTs[i].x1,manyGTs[i].y1,manyGTs[q].x1,manyGTs[q].y1);
//    }
//    strokeWeight(3);
//    stroke(0);
//  }
//}

//como Gravity's Rainbow, except this is GRAVITY TRIANGLE

//the class of GravityTriangle has exactly 1 variable to pass from the function
//into the object and that is the degree of opacity [where 0 = transparent]

//there are 2 functions within class
//void drawTrackers() which draw the ellipses that keep track of each vertex
//void drawTriangle() which does the obvious

class GravityTriangle {

  //attributes:  things the GravityTriangle has
  // setup for 1st x,y (gravity, speed, cordinates)
  float x1; //declare x1 for initial starting point dependent on width
  float y1 = 0;//y1 initial starting point
  float speedX1 = random(-2,2);//horizontal component of velocit for vertex 1
  float speedY1 = random(0,2);// vertical component of velocity for vertex 1
  float dampenX1 = random(-1.05f,-1.5f);
  float dampenY1 =random(-.99f,-1);
  float gravity1 = random(.05f,.08f);
  // setup for 2nd xy (gravity, speed, coordinates)
  float x2;  //decalre x2 for starting point dependent on setup width
  float y2 = 0;
  float speedX2 = random(-2,2);
  float speedY2 = random(.5f,2);
  float dampenX2 =random(-1.05f,-1.15f);
  float dampenY2 =random(-.99f,-1.0f);
  float gravity2 = random(.05f,.09f);

  // setup for 3nd xy (gravity, speed, coordinates)
  float x3;  //declare x3 for starting point dependent on setup width
  float y3 = 0;
  float speedX3 = random(-2,2);
  float speedY3 = random(0,5);
  float dampenX3 = random(-1.1f,-1.15f);
  float dampenY3=random(-.99f,-1);
  float gravity3 = random(.04f,.08f);

  float cr,cg,cb,ca;

  //CONSTRUCTOR:  this creates a GravityTriangle based on the variables I define
  GravityTriangle(float _ca) {

    //ca=_ca; //which means that the only variable I am passing in is the level of opacity
    cr=random(255);
    cg=random(255);
    cb=random(255);
    ca=_ca;
    //ca=random(255);
    x1=random(width);
    x2=random(width);
    x3=random(width);
  }
  public void drawTrackers() {  //for tracking purposes
    fill(255,0,0);
    ellipse (x1,y1,mouseX/5,mouseX/5);
    fill(0,255,0);
    ellipse (x2,y2,mouseY/5,mouseY/5);
    fill(0,0,255);
    ellipse (x3,y3,(mouseX-mouseY)/10,(mouseX-mouseY)/10);

  }

  public void drawTriangle() {
    smooth();
    fill(cr,cg,cb,ca);
    triangle(x1,y1,x2,y2,x3,y3);


    //creating the moveTriangle function
    // bouncing for 1st xy
    y1=y1+speedY1;//add speed to location
    x1=x1+speedX1;
    speedY1=speedY1+gravity1;//add gravit to speed
    //setup for 2nd xy
    y2=y2+speedY2; //add speed to the y2 ooordinates
    speedY2=speedY2+gravity2;
    x2=x2+speedX2; 
    //setup for 3nd xy
    y3=y3+speedY3; //add speed to the y2 ooordinates
    speedY3=speedY3+gravity3;
    x3=x3+speedX3;
    //creating the bounceTriangle function
    //if the triangle reaches the bottom reverse the speed
    //x1,y1 check bounce and dampen
    if (y1>height) {
      speedY1=speedY1*dampenY1; // change direction with dampening
    }
    if ((x1>width)||(x1<0)) {
      speedX1=speedX1*dampenX1; //change direction with dampen
    }
    //x2,y2 check bounce and dampening
    if (y2>height) {
      speedY2=speedY2*dampenY2;  //change direction with dampen
    }
    if ((x2>width)||(x2<0)) {
      speedX2=speedX2*dampenX2;  //change direction with dampen
    }
    //x3,y3 check bounce and dampen
    if (y3>height) {
      speedY3=speedY3*dampenY3;  //change direction with dampen
    }
    if ((x3>width)||(x3<0)) {
      speedX3=speedX3*dampenX3; // change direction with dampen
    }
  }
 // void drawLines(){
 //   line(x1,y1
}

////calling on the Gravity Triangle class to make an object
//
//
//GravityTriangle myFirstGT;// declaring the object variable from the class
//GravityTriangle myFirstGT2;
//GravityTriangle myFirstGT3;
//
//void setup(){
//  size(1024,768);
//  myFirstGT2 = new GravityTriangle();
//    myFirstGT3 = new GravityTriangle();
//  myFirstGT = new GravityTriangle();
//}
//void draw(){
//  background(255);
//  //myFirstGT.drawEllipseMarker(); 
//  myFirstGT.drawTriangle();
//  myFirstGT.drawTrackers(); 
//  myFirstGT2.drawTriangle();
//  myFirstGT2.drawTrackers(); 
//    myFirstGT3.drawTriangle();
//    myFirstGT3.drawTrackers(); 
//  
//  //myFirstGT.moveTriangle();
//  //myFirstGT.bounceTriangle();
//}
//
//

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_oct15b_GravityTriangle_ARRAY" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
