// Jason Stephens
// Introduction To Computational Media (ICM)
// Week:3_Practice_cirlceGrow and shrinking
// ITP - Fall 2010


int circlegrow = 0;
int speed = 1;
int circlegrowX = 100;
int circlegrowY = 100;

void setup(){
  size(200,200);
  smooth();
  background(0);
}

void draw(){
  background(0);
  strokeWeight(3);
  stroke(255);
  fill(0);
  ellipse(mouseX,mouseY,circlegrow,circlegrow);
  circlegrow = circlegrow + speed;
  if ((circlegrow > 200) || (circlegrow < 0)) {
    speed = speed * -1;
  }
}

