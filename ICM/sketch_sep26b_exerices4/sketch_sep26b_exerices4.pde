// Jason Stepwhens
// ITP - Fall 2010
// Introduction To Computational Media (ICM)
// Week:3_Exercise:4-4

float w = 0;
float x1 = 50;
float y1 = 50;
float speedgrow = 1;

void setup(){
  size(200,200);
  smooth();
  background(255);
}

void draw(){
  
  fill(200);
  stroke(100);
  strokeWeight(1);
  ellipse(x1,y1,w,w);
  ellipse(x1+100,50,w,w);
  ellipse(50,150,w,w);
  ellipse(150,150,w,w);
  w = w + speedgrow;
  if ((w > 200) || (w <0)){
    speedgrow = speedgrow *-1;
  }
  
  
}
