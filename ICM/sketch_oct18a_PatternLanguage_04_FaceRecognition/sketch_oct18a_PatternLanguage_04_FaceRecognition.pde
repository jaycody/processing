//Jason Stephens
//ICM - Fall 2010
//Midterm Project

//ROTA FORTUNAE

/*The Wheel of Fortune, or Rota Fortunae, is a concept in medieval and ancient philosophy 
 referring to the capricious nature of Fate. 
 The wheel belongs to the goddess Fortuna, who spins it at random, 
 changing the positions of those on the wheel - 
 some suffer great misfortune, others gain windfalls. 
 Fortune appears on all paintings as a woman, sometimes blindfolded, "puppeteering" a wheel.
 [http://en.wikipedia.org/wiki/Rota_Fortunae] 
 
 "...Are you trying to stay the force of her turning wheel? Ah! dull-witted mortal, 
 if Fortune begin to stay still, she is no longer Fortune."
 ~ Boethius, Consolation of Philosophy
 
 PROJECT:
 The ROTA FORTUNAE stands as a larger-than-life, rear screen projected, spinning Wheel of Fortune.  The
 wheel consists of 3 images joined together to form an emergent rotating shape.  A phsycial interface,
 of arcade game control console height and size, presents a would-be participant with 5 controls
 (3 knobs and 2 buttons).  2 knobs control the width and height of the 3 images, 1 knob controls
 the rotation of the wheel, 1 button randomly selects the images used to populate the wheel, and 1 button
 saves and sends a screen shot of the wheel's "reading" to a database for later use (eg, printing on the spot
 or emailing to the participant).
 
 CURRENT ITERATION:
On the initial screen, a mousePress randomly selects 3 images, from an array of 238, 
which are joined together to form an emergent rotating shape. 
MouseX and mouseY control the size of each image while keyPressed PLUS mouseX controls 
the rotation rate. A left-sided column of 3 image frames display the 
randomly selected images used in the rotating shape.
*/
 


//declaring a variable of type PImage

PImage img;
float x,y;
float rot;
float m;
float r;
int numberPicts = 238;
int imageIndex = 0; // initial image to be displayed
int imageIndex2 =50;
int imageIndex3=200;
int imageIndex4=100;

PImage [] images = new PImage[numberPicts];


//face detection information
//import hypermedia.video.*;
//import java.awt.Rectangle;
//OpenCV opencv;


void setup() {
  background(0);
  size(1400,1050);
  for(int i=0; i<numberPicts;i++) {
    images [i] = loadImage("unedited" + i + ".png");
  }
  //make new instance of a PImage class by loading an image file
  img = loadImage("unedited0.png");
  x=width/2;
  y=height/2.0;
  rot=0;
  float r;

  //face detection information for setup
  //opencv = new OpenCV( this );
  //opencv.capture( width, height );                   // open video stream
  //opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  // load detection description, here-> front face detection : "haarcascade_frontalface_alt.xml"
}

//public void stop???  wtf?
//public void stop() {
//opencv.stop();
//super.stop();
//}


void draw() {
  pushMatrix();//save a copy of the original coordinate system so that 3 images can be displayed
  translate(x,y);
  rotate(rot);
  image(images[imageIndex3],10,10,mouseX*2,mouseY*2);//ORIGINAL 3
  //image(images[imageIndex4],10,10,mouseX*2,mouseY*.5);//copy 3
  //image(images[imageIndex3],0,15,(width-mouseX)/5,(height-mouseY));//COPY 3
  image(images[imageIndex2],-10,-10,mouseY,mouseX);//ORIGINAL 4 inner extending out
  image(images[imageIndex],0,5,mouseX,mouseY/2);//ORIGINAL 5 inner circle
  if(mousePressed==true) {
    imageIndex = int(random(237));
    imageIndex2= int(random(237));
    imageIndex3=int(random(237));
    imageIndex4=int(random(237));
  }
  popMatrix();//reload original aspect ratio to create space for the images on the right?
  strokeWeight(2);
  stroke(255);
  fill(0);
  rect(width/25-10,90,370,220);
  image(images[imageIndex3], width/25, 100,350,200);
  rect(width/25-10,height/2-110,370,220);
  image(images[imageIndex2], width/25, height/2-100,350,200);
  rect(width/25-10,height-310,370,220);
  image(images[imageIndex], width/25, height-300,350,200);

  println(r);
  println(rot);

  rot+=r;

  if (keyPressed ==true) {
    //r = map(mouseX,0,width,10.01,10.1);
    r = map(mouseX,0,width,0,12);
  }
}
//void keyPressed() {
//    r = map(mouseX,0,width,10.01,10.1);
//}

//float r = map(faces[i].x,0,faces[i].width,10.01,10.1);
//rot +=r;
//println(r);
//println(rot);

//face detection information
// grab a new frame
// and convert to gray
//  opencv.read();
//  opencv.convert( GRAY );

// proceed detection
//  Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );

// display the image
//image( opencv.image(), 0, 0 );

// draw face area(s)
//noFill();
//stroke(255,0,0);
//for( int i=0; i<faces.length; i++ ) {
//float r = map(faces[i].x,0,faces[i].width,10.01,10.1);
//rot +=r;
//print(r);


//rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height );

