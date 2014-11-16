// Jason Stephens
// ITP - Fall 2010
// Introduction To Computational Media (ICM)
// Week:3_exercise 4-4

int w = width;
int h = height; 
int x = width/2;
int y = height/2;


//basics
void setup() {
  size(200,200);
  background(255);

  int x = width/2;
  int y = height/2;
}

void draw() {
  line(x,y,width/2,height/2);
  line(0,height,width/2,height/2);
  line(width/2,height/2,height,width);
  //  triangle(0,height,width/2,height/2,width,height);
  x = x + 1;
  if (x>500) {
    y= y+1;
  }
  if (y>500) {
    x = x*-1;
    y = y*-y/2;
  }
}

