// vector function

void setup(){
  size(400,400);
  smooth();
}

void draw () {
  background(255);
  stroke (0);
  
  PVector center = new PVector(width/2, height/2);
    PVector mouse = new PVector(mouseX, mouseY);
    
    mouse.sub(center);
    
    translate (width/2, height/2);
    line(0,0, mouse.x,mouse.y);
    
    float m = mouse.mag();  // uses pathogorean therom
    fill(0);
    
    text(m,10,20);
}
