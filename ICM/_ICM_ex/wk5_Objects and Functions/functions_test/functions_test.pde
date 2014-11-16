float x;
float y;

void setup() {
  size(600,400); 
  smooth();
  // Make raindrop appear at a random x position
  x = random(0,600);
}

void draw() {
  background(666699);
  displayRainDrops();
  fallDrops(1);
  stopDrops();
}

void displayRainDrops() {
  // Display raindrops
  fill(255);
  ellipse(x,y,7,10);
}

void fallDrops(float speed) {
  // Make them fall
  y = y + speed ;
}

void stopDrops() {

  // Make them stop at the ground
  if (y > 400) {
    y = 400;
  }
}

