
float b = 255;


void setup() {
  size(200,200);  
}

void draw() {
  
  // here is code that runs whether the mouse is pressed or not
  
  if (mousePressed) {
    // here is code that runs when the mouse is pressed
    background(random(255)); 
  } else {
    // here is code that runs only when the mouse is not pressed
    background(color(0,255,0));
  }
  
}

void mousePressed() {
  //background(random(255)); 
}
