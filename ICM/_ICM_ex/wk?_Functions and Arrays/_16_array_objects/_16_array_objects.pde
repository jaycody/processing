// Daniel Shiffman
// <http://www.shiffman.net>

// Another array of objects example

Stripe[] stripes = new Stripe[50];

void setup() {
  size(200,200);
  framerate(30);
  // Initialize all "stripes"
  for (int i = 0; i < stripes.length; i++) {
    stripes[i] = new Stripe();
  }
}

void draw() {
  background(100);
  // move and display all "stripes"
  for (int i = 0; i < stripes.length; i++) {
    stripes[i].move();
    stripes[i].render();
  }
}


