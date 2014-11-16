
void setup() {
  size(200,200);
}

void draw() {
  println(mouseX + "," + mouseY);


  if (mouseX > 150) {
    background(255,0,0);
  } else if (mouseX > 70) {
    background(0,0,255);
  } else if (mouseX > 30) {
    background(0,255,0); 
  } else {
    background(255); 
  }
}

