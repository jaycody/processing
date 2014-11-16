class Raindrop {
 float x,y,r;
 float speed;
 
 Raindrop(float tempX, float tempY) {
   x = tempX;
   y = tempY;
   speed = random(1,3);
   r = 20;  
 }
 
 void display() {
   fill(0);
   ellipse(x,y,r,r); 
 }
 
 void fall() {
   y = y + speed; 
 }
 
 void stop() {
   if (y > height) {
     y = height;
   } 
 }
}
