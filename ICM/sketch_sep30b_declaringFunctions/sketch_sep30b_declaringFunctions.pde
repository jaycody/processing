// Jason Stephens
// Introduction To Computational Media (ICM)
// ITP - Fall 2010
// Week:4_Practice:  Declaring Functions

// declaring functions

void setup() {
  size(500,500);
  smooth();
}


void draw() {
  background(255);
  makeCircle(400,20,0);
  makeCircle(30,200,255);
  makeCircle(100,500,100);
  makeCircle(300,100,200);

}

void makeCircle(int x, int y, int c) {
  fill(c,x,y,y);
  ellipse(y+x,y,x,y);
  ellipse(x,y,40,40);
  ellipse(x+20,y-3,60,60);
  triangle(x,y,y,x,y+x,c);
  fill(y,c,x);
  ellipse(y,y,x,y);
  ellipse(x,x,c,40);
  ellipse(x+20,c-3,60,60);
  triangle(x,y,y,x,y+x,c);
  fill(x,x,c,c);
  ellipse(x,c,x,y);
  ellipse(y,y,40,40);
  ellipse(x+20,x-3,x,60);
  triangle(x,x,y,x,y+x,c);
}

