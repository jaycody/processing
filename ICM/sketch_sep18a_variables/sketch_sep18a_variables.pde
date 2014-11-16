//Jason Stephens
//ICM Fall 2010 - ITP
//wk 2 - Variables
//Declaring Global Variables
//setup and draw
//for loops
//using mouse clicks and input

void setup ()
{
  size (1024,768);  //establishing screen size
  background(0);  //background color
  smooth();
  
  noFill();  //creates empty polygon
  stroke(255); //outline of perimeter
  strokeWeight(8); //width of perimeter stroke
  polygon(5, 500, 300, 275, 275, -PI / 2.0); // -90 degrees
}

void polygon(int n, float cx, float cy, float w, float h, float startAngle)
{
  float angle = TWO_PI/ n;

  /* The horizontal "radius" is one half the width;
     the vertical "radius" is one half the height */
  w = w / 2.0;
  h = h / 2.0;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + w * cos(startAngle + angle * i),
      cy + h * sin(startAngle + angle * i));
  }
  endShape(CLOSE);
}

