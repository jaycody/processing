float x = random(0,width);
float y = 0;
float a = random(0,width);
float b= random(0,height);
float xspeed= 5;
float yspeed =5;
float radius =32;
float gravity =.1;

void setup() {
  size (1024,768);
  smooth();
  stroke(0);
  fill(0);
}

void draw() {
  background(255);
  moveBall();
  checkBounce();
  drawBall();
  gravityBall();
}


void moveBall() {
  x = x + xspeed;
  //yspeed = yspeed + gravity;
  //gravity = gravity+x*.8;
  y = y + yspeed;
}

void gravityBall(){
  yspeed = yspeed + gravity;
}
void checkBounce() {
  if((x>width)||(x<0)){
    xspeed=xspeed*-1;
  }
  if ((y>height)||(y<=0)){
    yspeed = yspeed*-1.02;//dampen
  }
  println(yspeed);
}

void drawBall(){
  //ellipse(x,y,radius,radius);
  line(x,y,a,b);
}

