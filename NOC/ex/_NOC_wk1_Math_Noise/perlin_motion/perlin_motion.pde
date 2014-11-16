// perlin noise 1 d

float xoff = 0.0;
float xincrement = 0.01; 

float yoff = 0.2; //try 1.0
float yincrement = 0.01; 

boolean userandom = false;

void setup() {
  size(400,400);
  background(0);
  frameRate(30);
  smooth();
  noStroke();
  
  // if you are in random mode use a different value
  if(userandom)
  yincrement = 0.0001;
  else
  yincrement = 0.01;
  
}

void draw()
{
  // Create an alpha blended background
  fill(0, 10);
  rect(0,0,width,height);
  
  //float n = random(0,width);  // Try this line instead of noise
  
  // Get a noise value based on xoff and scale it according to the window's width
  float n = noise(xoff)*width;
   float j;
  if(userandom)
      j = random(yoff)*height;
   else
      j = noise(yoff)*height; 
  
  // With each cycle, increment xoff
  xoff += xincrement;
   // With each cycle, increment yoff
  yoff += yincrement;
  
  // Draw the ellipse at the value produced by perlin noise
  fill(200);
  // check or random
  if(userandom)
    ellipse(n,j+height/2,16,16);
  else
    ellipse(n,j,16,16);
}
