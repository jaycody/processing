
float x;
float y;

void setup() {
  size(200,200);
  background(255);
}

void draw() {
  x = random(0,200);
  y = random(0,200); 

  ellipse(x,y,20,20);
}

