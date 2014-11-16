class Ball{
  //ATTRIBUTES: things that a ball has
  color c;
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float radius;
  
  
  //CONSTRUCTOR: this creates a ball based on variables you define
  Ball(float xTemp, float yTemp, float xSpeedTemp, float ySpeedTemp)
  {
    c = color(random(0,255));
    xPos = xTemp;
    yPos = yTemp;
    xSpeed = xSpeedTemp;
    ySpeed = ySpeedTemp;
    radius = random(20,40);
  }
  
  void moveBall()
  {
  xPos = xPos + xSpeed;
  yPos = yPos + ySpeed;  
  }
  
  void checkBounce()
  {
   if ((xPos > width) || (xPos < 0)) {
     // If the object reaches either edge, multiply speed by -1 to turn it around.
     xSpeed = xSpeed * -1;
   }
  
   if ((yPos > height || yPos < 0)) {
     ySpeed = ySpeed * -1;
   }
  }
  
  void drawBall(){
  ellipse(xPos,yPos,radius,radius);
  }
}
