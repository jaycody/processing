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

void setup() {
  background(0);
  size(1424,1068);
  for(int i=0; i<numberPicts;i++) {

    images [i] = loadImage("unedited" + i + ".png");
  }


  //make new instance of a PImage class by loading an image file
  img = loadImage("unedited0.png");
  x=width/2;
  y=height/2.0;
  //rot=.2;//ORIGNAL rot value
  rot=0;
  t=0;
  speedT=2;
}

void draw() {
  //background(0);

  translate(x,y);
  rotate(rot);
  //rectMode(CENTER);
  //image(img,m,0,mouseX,mouseY);//ORIGINAL 1
  //image(images[imageIndex4],5,0,mouseX/2,speedT);//ORIGINAL 2
  image(images[imageIndex3],10,10,mouseX*2,mouseY*2);//ORIGINAL 3
  //image(images[imageIndex3],0,15,(width-mouseX)/5,(height-mouseY)*2);//COPY 3
  image(images[imageIndex2],-10,-10,mouseY,mouseX);//ORIGINAL 4 inner extending out
  image(images[imageIndex],0,5,mouseX,mouseY/2);//ORIGINAL 5 inner circle
  image(images[imageIndex4],mouseY/4,mouseX/4,speedT,speedT);//ORIGNIAL 6 yet not effect
  if(mousePressed==true) {
    imageIndex = int(random(237));
    imageIndex2= int(random(237));
    imageIndex3=int(random(237));
    imageIndex4=int(random(237));
  }
  //translate and rotate
  //rectMode(CORNERS);
  float m = map(mouseX,0,width,255,100);//ORIGINAL
  //float d = map(mouseY,0,height,255,0);
  //tint(255,255,255,m);//ORIGNIAL
  //image(img,noise(mouseX/7),mouseY/4,mouseX*2,mouseY*2);
  t = t + speedT;
  if ((speedT>200)||(speedT<0)) {
    speedT=speedT*-1;
  }
  //adjust variables to create animation
  x+= 0.0;
  // rot +=8;
  //rot+=10000;
  //rot += 10.021; //ORIGINAL
  float r = map(mouseX,0,width,6,13);
  rot +=r;
  //rot +=10;
  //rot +=20.707963;
  println(r);
  println(rot);
  //println(rot);
  if (x>width) {
    x=0;
  }
}

