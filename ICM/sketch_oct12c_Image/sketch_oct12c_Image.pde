PImage img;
float x;

void setup() {
  size(1024,768);
  img = loadImage("before.jpg");
  x=1;
}
void draw() {
  float r = random (0,60);
  image(img,(random(0,700)),100/x,600/r,600);
  tint((random(0,255)),(random(0,255)),(random(0,255)),(random(0,255)));
  stroke(0);
  x = x+1;
}

