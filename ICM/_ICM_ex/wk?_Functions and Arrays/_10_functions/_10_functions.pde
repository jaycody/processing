// Daniel Shiffman
// <http://www.shiffman.net>

// Breaking down a program into parts
// Each part is defined as a functionj 

// Declare global variables
int x = 0;     // x location of square
int y = 100;   // y location of square
int speed = 2; // speed of square movement

void setup() {
  size(200,200);
  framerate(30);
}

void draw() {
  render();
  move();
  bounce();
}

// Draw background and square
void render() {
  background(100);
  rectMode(CENTER);
  noStroke();
  fill(255);
  rect(x,y,16,16);
}

// Change x location of square by speed
void move() {
  x = x + speed;
}

// If square goes off of the edge, reverse speed direction
// (Note if speed is a positive number, square moves to the right, negative to the left)
void bounce() {
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  }
}
