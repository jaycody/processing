//make the Eye class

class Eye {
  
  float radius;
  float xPos;
  float yPos;
  float xVelocity;
  float yVelocity;
  float clr;
  float alph;
  
 Eye(float _xPos, float _yPos, float _radius, float _clr, float _alpha){
  
   radius = _radius;
   xPos =_xPos;
   yPos = _yPos;
   clr = _clr;
   alph = _alpha;
   
 } 
  
 void look(){
   render();
 }
 
   void render(){
     
     stroke(alph,alph);
     strokeWeight(2);
     alph += random(-2,2);
     alph = constrain (alph, 50,200);
     radius += random(-2,2);
     radius = constrain (radius, 10,70); 
     xPos +=random(-4,4);
     yPos +=random(-4,4);
      rectMode(CENTER);
      fill(clr,alph);
      ellipse (xPos, yPos, radius*2, radius*2);
      if (xPos>width)
      xPos = width;
      if (xPos<0)
      xPos = 0;
      if (yPos<0)
      yPos = 0;
      if (yPos>height)
      yPos = height;
      
      
}
}
