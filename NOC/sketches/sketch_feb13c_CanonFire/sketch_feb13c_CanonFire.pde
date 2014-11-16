float angle = 0; // location
float aVelocity = 0; // velocity
float aAcceleration = 0.0001; //acceleration
boolean fireButton;

 float x = width/4;
  float y = 15;
     PVector loc;
  PVector vel;
  PVector acc;
  PVector force;
void setup() {
  size(400,400);
  fireButton = false;
  force = new PVector (0,.1);
 
  loc = new PVector (x,y);
  vel = new PVector (4,-2);
  acc = new PVector (.1,.2);
}

void draw() {
  background(255);
  fill(175);
  stroke(0);
  rectMode(CORNER);
  rect(0,0,200,30);
  fill(255,0,0);
  pushMatrix();
  translate(30,height-30);
  //rect(0,0,200,30);
  rotate(radians(-60));
  rect (0,0,width/4,30);
   if (mousePressed== true){
  fireButton = true;
  //render();
   }
   if (fireButton == true) {
     render();
     fire();
   }
    popMatrix();
  spin();
  //if (fireButton =  true ){
  //render();
  //popMatrix();
 
 
  //  if (mousePressed== true){
  //    render();
  //}
}

void render() {
  fill (0);
  //ellipse(width/4,15,20,20);
}

void fire (){
 
  ellipse (x+loc.x,y+loc.y,20,20);
  acc.add(force);
  vel.add(acc);
  loc.add(vel);
  print(loc.x);
  acc.mult(0);
}

void spin () {
  pushMatrix();
  rectMode(CENTER);
  translate(width/2,height/2);
  rotate(angle);
  line(-50,0,50,0);
  ellipse(50,0,8,8);
  ellipse(-50,0,8,8);
  popMatrix();
  aVelocity += aAcceleration; // Angular equivalent of velocity.add(acceleration);
  angle += aVelocity; //Angular equivalent of location.add(velocity);
}
  
