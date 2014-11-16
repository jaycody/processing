// Bouncing Ball
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 5-6: Bouncing Ball
// CHANGED ints to floats to use random
float x = random(0,width);
float y = 0;
float xSpeed = 1;  //xspeed
float ySpeed = 1;  //yspeed
float radius = 32; //radius of circle

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  background(255);

  // Add the current speed to the x location.
  x = x + xSpeed;
  y = y + ySpeed;

  // Remember, || means "or."
  if ((x > width) || (x < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    xSpeed = xSpeed * -1;
  }
  
  if ((y > height || y < 0)) {
    ySpeed = ySpeed * -1;
  }

  // Display circle at x location
  stroke(0);
  fill(175);
  ellipse(x,y,radius,radius); //made y a variable!
 
}









