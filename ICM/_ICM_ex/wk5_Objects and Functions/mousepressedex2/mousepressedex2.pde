
float b = 255;


void setup() {
  size(200,200);
}

void draw() {
  // here is code that runs whether the mouse is pressed or not
  background(b);  

}

  void mousePressed() {
    b = random(255);
  }

