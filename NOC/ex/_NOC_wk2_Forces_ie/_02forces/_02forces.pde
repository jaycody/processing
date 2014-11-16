Mover m;
int x = 0;

void setup() {
  size(200,200);
  smooth();
  background(255);
  m = new Mover(); 
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);

  PVector wind = new PVector(0.001,0);  // create force of wind PVector
  PVector gravity = new PVector(0,0.1); // create force of gravity PVector
  PVector oil = new PVector (1,0); // create the reduced friction of oil
  m.applyForce(wind); // then pass Wind Force PVector
  m.applyForce(gravity);  //then pass Gravity Force PVector
  
  if (mousePressed) {
    x=x+1;
  }
  if (x== 2){
    oil.mult(0);
  }
  if (x==1){
    m.applyForce(oil);
  }


  m.update();  //then update
  m.display(); // then display
  m.checkEdges(); // then check edges

}





