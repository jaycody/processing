// build the GuassianWalker class
// Guassian or "normal" bell curve distribution
/* demonstrate Guassian probabilities by modeling
a single drop of water in a water fountain.  
*/

class GuassianWalker {
  
  float x,y;
  
  GuassianWalker() {
    x = width/4;
    y = height/4;
  }
  
  void render () {
    fill (0,255,0);
    rectMode(CENTER);
    rect(x,y, 10,10);
    
  }

void walk (){
  float vx = random(-5,5);
  float vy = random(-5,5);
  
    x+= vx;
    y+= vy;
}
void bounce () {
  if ((x>width) || (x<0))
  x = x * -1;
  
  if ((y>height) || (y<0))
  y = y * -1;
}
}
 



