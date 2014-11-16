// Wolfram CA texture into an off-screen graphics buffer
// CA code from the Processing book (Reas/Fry)
 
 
import processing.opengl.*;
import peasy.*;
Cube cb;
Automata[] automatas = new Automata[6];
PeasyCam pCamera;
float deg = 0.0;
int res = 50;
void setup()
{
  size(500,500,OPENGL);
  pCamera = new PeasyCam(this, 80);  
  for(int i = 0; i <automatas.length; i++) {
    automatas[i] = new Automata();
  }
  cb = new Cube(new PVector(0, 0, 0), new PVector(20,20,20));
  hint(ENABLE_OPENGL_4X_SMOOTH);
}
  
void draw()
{
  background(255);
  for(int i = 0; i <automatas.length; i++) {
    automatas[i].render();
  }
    
  rotateX(radians(-30));
  pushMatrix();
  rotateY(radians(30));
      cb.build();
  popMatrix();
}
  
 
  
void keyPressed()
{
  if (key == 's') saveFrame();
  if(key == 'r'){
    for(int i = 0; i <automatas.length; i++) {
      automatas[i].startAutomata();
    }
  }
}

