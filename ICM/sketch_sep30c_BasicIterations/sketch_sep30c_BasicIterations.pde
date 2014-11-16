// Jason Stephens
// Introduction To Computational Media (ICM)
// ITP - Fall 2010
// Week:4_Practice:  Back to Basics

float x = .1;
float y = 1;

void setup (){
  background(255);
  size(1024,768);
}

void draw(){
  stroke(255,0,0);
  strokeWeight(1);
  line(x+100,y+10,x,x*x+y);
  x = x+y/100+1;
  y = y+x + 1;
}
