// Bouncing Ball NOW WITH FUNCTIONS

float x = random(0,width);  //sets original x of ball
float y = 0; //sets original y of ball
float xSpeed = 1;  //xspeed
float ySpeed = 1;  //yspeed
float radius = 32; //radius of circle

void setup() {
  size(200,200);
  smooth();
  stroke(0);
  fill(175);
}

void draw() {
  background(255);
  moveBall(); 
  checkBounce();
  drawBall();

}


//FUNCTIONS://

//moveBall() changes the x and y coordinates of the ball
void moveBall(){
  x = x + xSpeed;
  y = y + ySpeed;
}

//checkBounce() checks to see if the ball has hit the edge. 
//if it has, it reverses the direction of the ball.
void checkBounce(){
    if ((x > height) || (x < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    xSpeed = xSpeed * -1;
  }
  
  if ((y > height || y < 0)) {
    ySpeed = ySpeed * -1;
  }
}


//drawBall() draws the ball to the screen
void drawBall(){
  ellipse(x,y,radius,radius); //made y and radius variables!

}





