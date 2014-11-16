// Jason Stephens
// ITP - Fall 2010
// Introduction To Computational Media (ICM)
// Week:3_Practice_easing_examplefromShiffmas


float x;
float y;
float targetX, targetY;
float easing = 0.05;

void setup()
{
 size(200, 200);
 smooth();
 noStroke();
}

void draw()
{
 background( 51 );

 //targetX = width-mouseX; //shiffman's example OPPOSISTE
 targetX=mouseX;
 float dx = targetX - x;
 if(abs(dx) > 1) {
   x += dx * easing;
 }

 //targetY = height-mouseY;
 targetY = mouseY;
 float dy = targetY - y;
 if(abs(dy) > 1) {
   y += dy * easing;
 }

 //ellipse(width-mouseX,100, 33, 33);
 ellipse(x, y, 33, 33);
}
