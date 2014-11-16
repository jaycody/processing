// Jason Stephens
// ITP - Fall 2010
// Introduction To Computational Media (ICM)
// Week:3_exercise 4-6  using Random and constrain

float x=25;
float movementX = 1;

float y=25;
float movementY=1.2;

void setup() {
  size(200,200);
  background(0);
}

void draw() {
  ellipse(y,x,50,50);
  x=x+movementX;
  y=y+movementY;

  x += random(-1,1);
  x = constrain(x,0,width);
  y += random(-1,1);
  y = constrain(y,0,width);

  if ((x>175)||(x<25)) {
    movementX = movementX*-1;
  }

  if ((y>175)||(y<25)) {
    movementY=movementY*-1;
  }
}


