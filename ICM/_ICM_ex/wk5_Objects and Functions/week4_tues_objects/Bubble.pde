
class Bubble {
  
  float x;
  float y;
  float r;
  
  Bubble(float tempX) {
    x = tempX;
    y = 300;
    r = 20; 
  }
 
  void display() {
    fill(0);
    ellipse(x,y,r,r);
  } 
  
  void move() {
    y = y + random(-2,1); 
    x = x + random(-1,1);
  }
  
}
