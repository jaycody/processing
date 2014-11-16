// Bouncing Ball NOW WITH FUNCTIONS

Ball myBall;
float x = random(0,width);
float y = 0;
float moveX = random(-4,4);
float moveY = random(0,4);

int numberBalls = 100;
Ball[] manyBalls = new Ball[numberBalls];

void setup() 
{
  size(800,800);
  smooth();
  stroke(0);
  fill(175);

  //MAKE numberBalls number of balls and put them in an array!
  for (int i = 0; i< manyBalls.length; i++) {
    

    manyBalls[i] = new Ball(x*i,y/i,moveX/i,moveY);
    //note: these will all be the same!
    //how could we change this?
  }
  manyBalls[30].radius = 2;
  manyBalls[10].radius = 20;
  manyBalls[30].xSpeed = 1;
  
}

void draw() 
{
  background(255);
  for (int i = 0; i< numberBalls; i++) {  //instead of "numberBalls" use manyBalls.length 
    //where length is length of the array.
    manyBalls[i].moveBall();
    manyBalls[i].checkBounce();
    manyBalls[i].drawBall();
    
  }
}





