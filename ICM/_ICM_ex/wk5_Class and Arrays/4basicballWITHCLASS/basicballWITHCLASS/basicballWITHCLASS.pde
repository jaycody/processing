// Bouncing Ball NOW WITH FUNCTIONS

Ball myBall;
Ball myBall2;

float x = random(0,width);
float y = 0;
float moveX = random(-4,4);
float moveY = random(0,4);


void setup() 
{
  size(200,200);
  smooth();
  stroke(0);
  fill(175);
  myBall = new Ball(x,y,moveX-5,moveY-2);
  myBall2 = new Ball(x,y,moveX,moveY);
}

void draw() 
{
  background(255);
  myBall.moveBall();
 myBall2.moveBall(); 
  myBall.checkBounce();
  myBall2.checkBounce();
  myBall.drawBall();
  myBall2.drawBall();
}






