
void setup() {
  size(200,200);
}

void draw() {
  println(mouseX + "," + mouseY);

  background(255);


  if ((mouseX > 50) && (mouseX < 100) && (mouseY > 50) && (mouseY < 100)) {
    fill(255,0,0);
  }   else {
    fill(0,0,255);
  }

  rect(50,50,50,50);
}

