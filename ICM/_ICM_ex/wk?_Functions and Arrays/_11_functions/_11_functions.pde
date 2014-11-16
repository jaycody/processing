// Daniel Shiffman
// <http://www.shiffman.net>

// Simple function example
// Demonstrates re-usability of function
// and parameter passing

void setup() {
  size(200,200);
  framerate(30);
}

void draw() {
  background(100);
  // Calling the Function
  drawFancyShape(50,50);
  // Calling the Function again!
  drawFancyShape(100,150);
}

// Our re-useable function that
// Draws a custom shape at a location x,y
// x and y are arguments passed to the function
void drawFancyShape(float x, float y) {
  stroke(255);
  noFill();
  rectMode(CENTER);
  ellipseMode(CENTER);
  rect(x-10,y-10,10,10);
  ellipse(x+10,y-10,10,10);
  rect(x-10,y+10,10,10);
  ellipse(x+10,y+10,10,10);
}
