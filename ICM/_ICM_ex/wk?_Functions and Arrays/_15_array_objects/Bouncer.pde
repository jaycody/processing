// Daniel Shiffman
// <http://www.shiffman.net>

// Bouncing ball class
class Bouncer {

  float x,y;     // x and y location
  float gravity; // gravity
  float dy;      // amount by which we change y

    Bouncer(float x_, float y_) {
    x = x_;
    y = y_;
    dy = 0;
    gravity = 0.25;  // arbitrary amount of gravity
  }

  void go() {
     move();
     render();
  }

  void move() {
    dy += gravity;  // change dy by gravity
    y  += dy;       // change y by dy
    // If we get to the bottom of the screen, reverse ball direction
    if (y > height) {
      y = height;
      dy *= -0.95;
    }
  }

  // Display ball as an ellipse
  void render() {
    smooth();
    noStroke();
    fill(255,150);
    ellipse(x,y,16,16);
  }

}
