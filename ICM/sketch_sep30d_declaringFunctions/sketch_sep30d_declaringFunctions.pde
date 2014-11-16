// Jason Stephens
// Introduction To Computational Media (ICM)
// ITP - Fall 2010
// Week:4_Practice:  Declaring Functions AGAIN

void setup () {
  size(500,500);
  background(255);
}

void draw() {
  for (x=35;x<width;x+=500) {

    makeThis(x,25,100);
    makeThis(500,20,100);
    makeThis(0,255,400);
    makeThis(90,255,100);
    makeThis(30,25,10);
    makeThis(0,255,100);
  }
}

void makeThis(int x, int y, int z) {
  rect(x,y,z,z+x);
  triangle(x,y,y,x,z,y);
  ellipse(x,y,z,z);
}

