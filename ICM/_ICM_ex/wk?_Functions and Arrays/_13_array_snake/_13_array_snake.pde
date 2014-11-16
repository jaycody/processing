// Daniel Shiffman
// <http://www.shiffman.net>

// Array example
// Uses arrays to store a history of mouse locations

// Two arrays for x positions and y positions
int MAX = 50;
int[] xpos = new int[MAX];
int[] ypos = new int[MAX];

void setup() {
  size(200,200);
  framerate(30);
  smooth();
  // Fill the arrays with 0 at the start
  for (int i = 0; i < xpos.length; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
}

void draw() {
  background(100);

  // Move all values in the array down one spot (i.e. x[0] = x[1], x[1] = x[2], etc.)
  for (int i = 0; i < xpos.length-1; i++) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  // Fill the last spot of the array with the current mouse location
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;

  // Draw an ellipse with variable size and color for every element of each array
  for (int i = 0; i < xpos.length; i++) {
    noStroke(); fill(i*5);
    ellipse(xpos[i],ypos[i],i,i);
  }
}
