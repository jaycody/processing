// jason stephens
// nature of code: final project
// April 2011 - ITP - NYU

/* Multiple Reduction Copy Machine Algorithm
 Current Pattern Image Sketch Transforms and Rotates to form animated circle.
 This sketch with form Affine Transformation Fractals through a series of 
 transformations at every iteration.
 
 
 1.  Start by experimenting with the code
 2.  Then figure out what to do next
 3.  It's an iterative process, so at time =1, print once.  
 at time = 2, print time 1 AND time 2.  This can be done with an array
 
 3a.  How do I setup the iterative process without having to write the code for every iteration?
 
 4. How does one invert an image?
 5. How does one spin one thing without something else?  Push and Pop?  Done
 6. And make the emitting images a particle system with a life cycle.
 7. Write a counter function to increment the iterations
 
 8. Time to use OpenGL!
 */
 
 
 
 import processing.opengl.*;  //in order to do 3D affine transformations

//declaring a variable of type PImage
PImage img;

//declare the float variables
float x,y;
float xoff, yoff;
float rot;  // rotation
float m;
float t;
float speedT;  //wtf?
float scl;
float scl2; //scale change for MRCM_2
float scl3; // scale change for MRCM_3
  float xBC = 0; // x of Base Case
  float yBC = 0; // y of Base Case

//start a counter to increment the iterations
int counter = 0;

float theta;
float a;

//declare the ints
int numberPicts = 10;  //original # is 238, but I'm lowering it to 5 to make things faster.
int imageIndex = 0; // initial image to be displayed
int imageIndex2 =5; // initial value here is 50
int imageIndex3=2;// initial value is 200
int imageIndex4=1;

//declare the array
PImage [] images = new PImage[numberPicts];

void setup() {
  size(screen.width, screen.height, OPENGL);
  background(0);
  //size(1024,768);

  //initializing the array and filling it with all 238 images
  for(int i=0; i<numberPicts;i++) {
    images [i] = loadImage("unedited" + i + ".png");
  }

  //make new instance of a PImage class by loading an image file
  // this one is not part of the array and can be called seperately
  img = loadImage("unedited0.png");
  x=width/2 + xoff;
  y=height/2.0 + yoff;
  rot=.2;
  t=0;
  speedT=2;
  scl = .8;
  scl2 = .5;
  scl3 = .2;
  xoff= 0;
  yoff=0;
  float a = 1;
}

void draw() {
  rectMode(CORNER);
  //background(0);
  
 // translate(x,y);  //currently, move coordinate system to center of screen
  //rotate(rot);  //then rotate by rotation = .2 wtf?  is that radians?
  
   // Let's pick an angle 0 to 90 degrees based on the mouse position
 // float a = (mouseX / (float) width) * 90f;//original
  //float a = (mouseX / (float) width) * 180f;//this gave me the idea to animate....
  
  a = a+mouseX;
  
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height/2);
  // Draw a line 120 pixels
 // line(0,0,0,-120);
  image(images[imageIndex3],xBC,yBC,300,275);
//  image(images[imageIndex3],xBC,-120,300,-120);
 
  // Move to the end of that line
  translate(0,-120);
  // Start the recursive branching!
  branch(120);

  
  
  
  
  //--------------------------------------//
  if (counter == 1) {
    BaseCase();
  }
  
  if (counter ==2){
   MRCM();
  }
  
   if (counter ==3){
   MRCM_2();
  }
   if (counter ==4){
   MRCM_3();
  }



  //original orientation
  //image(images[imageIndex4],5,0,mouseX/2,speedT);
  //image(images[imageIndex3],10,10,mouseX*2,mouseY*2);
  //image(images[imageIndex2],-10,-10,mouseY,mouseX);
  //image(images[imageIndex],0,5,mouseX,mouseY/2);
  //image(images[imageIndex4],mouseY/4,mouseX/4,speedT,speedT);

  //NEW orientations
  // image(images[imageIndex3],10,10,mouseX,mouseY);
  // image(images[imageIndex3],10+m,10+m,mouseX,mouseY);

  if(mousePressed==true) {
    imageIndex = int(random(9)); //original value is 237
    imageIndex2= int(random(9));
    imageIndex3=int(random(9));
    imageIndex4=int(random(9));
  }

  //rot += 10.021;  // rotation +=10.021 is the original
}

void keyPressed() {  //counter to increment the iterations
  if (key == CODED) {
    if (keyCode == RIGHT) {
      counter ++;
    }
    if (keyCode == LEFT) {
      counter --;
    }
  }
  println(counter);
}

void BaseCase(){
  background(0);
  pushMatrix();
  translate(x,y);
  //background(0);
  image(images[imageIndex3],xBC,yBC,300,275);
  popMatrix();
}

void MRCM (){
  background(0);
  BaseCase();
    pushMatrix();
    xoff = -100;
    yoff = -40;
    translate (x+xoff, y+yoff);
    scale(scl);
    rotate(-2/PI);
    image(images[imageIndex3],xBC,yBC,300,275);
    popMatrix();
}
void MRCM_2 (){
  background(0);
  BaseCase();
  MRCM();
    pushMatrix();
    xoff = 240;
    yoff = -100;
    translate (x+xoff, y+yoff);
    scale(scl2);
    rotate(PI/4);
    image(images[imageIndex3],xBC,yBC,300,275);
    popMatrix();
}
void MRCM_3 (){
  background(0);
  BaseCase();
  MRCM();
  MRCM_2();
  pushMatrix();
   xoff = 190;
  yoff = 0;
  translate (x+xoff, y+yoff);
  scale(scl3);
  rotate(mouseX);
  MRCM_2();
  popMatrix();
 
}


void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.3;//.66 = original //seems that .71 is high end of this range
  // h *=map(h,0,1,0,mouseY);
   
   
 
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
     image(images[imageIndex3],xBC,yBC,300,-h);
    //line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
 
   rotate(-theta);
   
     image(images[imageIndex4],xBC,yBC,400,-h);
   // line(0, 0, 0, -h);
    translate(0, h); //orignal = translate(0,-h);
    branch(h);
     image(images[imageIndex2],25,25,500,h);
    popMatrix();
  }
}

  

