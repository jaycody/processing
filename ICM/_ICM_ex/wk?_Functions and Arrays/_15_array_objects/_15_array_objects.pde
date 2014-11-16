// Daniel Shiffman
// <http://www.shiffman.net>

// An array of bouncing balls
// Note how we only use part of the array at a time

int total = 0;  // we start with 0 balls
Bouncer[] balls = new Bouncer[25];  // we can have 25 balls in our system

void setup() {
  size(200,200);
  framerate(30);
}

void draw() {
  // Call "go()" on all the balls
  background(100);
  for (int i = 0; i < total; i++) {
    balls[i].go();
  }
}

// When the mouse is pressed create a new ball 
// at the mouse location
void mousePressed() {
  balls[total] = new Bouncer(mouseX,mouseY);
  total = (total + 1) % balls.length;  // note the use of modulo
  // Modulo calculates the remainer when one number is divided by another.  
  // For us, we use it to reset total to 0 when we reach the end of the array
}
