/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */

PImage a;  // Declare variable "a" of type PImage
PImage b;
int numberImages = 2;

PImage [] picts = new PImage[numberImages];
int x =0;
int speed = 2;
int y = 0;
int speedY=2;
int h = 255;
int l;

void setup() {
  size(500, 500);
  for (int i=0;i<picts.length;i++) {
    picts[i] = loadImage("Chaos.jpg");
  }
  // The file "jelly.jpg" must be in the data folder
  // of the current sketch to load successfully
  a = loadImage("jelly.jpg");  // Load the image into the program



  //noLoop();  // Makes draw() only run once
}

void draw() {
  //background(0);
  
 // for (int i = 0; i<picts.length;i++){
//   image(picts[i],i+200,i+50,(width-picts[i].width)-x,y);
  //}

  //for (int x = 0; x<width*3;x++) {
  image(a,(width-a.width)-x,0,width,height);
  image(a,100,0,x,y);
  // Displays the image at its actual size at point (0,0)
  image(a, 0+x, (height-a.height)-y); 
  // Displays the image at point (100, 0) at half of its size
  tint(x,l,y,h);
  image(a, 100, 0+y, a.width/2, a.height/2);
  x=x+speed;
  if ((x>width)||(x<0)) {
    speed = speed *-1;
    speedY= speedY*-1;
  }
  else {
    image(a,0+x,height-y,x,y);
  }
  //speed=0;
  if (speed == -2) {
    y=y+speedY;
    h=int(random(255));
    l=int(random(255));
  }
  if (speed == 2) {
    h=255;
  }
  //}
  //  else{
  //    h=0;

  if((y>height-a.height/2)||(y<0)) {
    speedY=speedY*-1;
    //  speed =2;
    //  speed = speed*-1;
  }
  for (int i = 0; i<picts.length;i++){
   image(picts[i],i+200,i+50,width-x,y);
  }
image(picts[0],width-x,y,x,x);

  //image(a,100,0);
}

