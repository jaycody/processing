// Jason Stephens
// ITP - Fall 2010
// Introduction To Computational Media (ICM)
// Week:3_exercise 4-4  using Random and constrain

float centerX = 100;
float centerY = 100;

void setup(){
size(200,200);
background(255);

}


void draw(){

  fill(255);
  ellipse(centerX,centerY,60,60);
  
  centerX += random(-10,10);
  centerY += random(-10,10);
  
  centerX = constrain (centerX,0,width);
  centerY = constrain (centerY,0,height);
  
  
}

