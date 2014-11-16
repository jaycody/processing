
int speed = 1;
int x = 100; // location of square

void setup(){
  size(200,200);
  background(0);
}

void draw(){
  x=x+speed;
  ellipse(x,100,50,50);
  fill(255);
  if ((x>width) || (x<0)){
    speed=speed*-1;
  }
}

//void equalBliss(int x, int y, int speed){
//  ellipse(x+speed,y,x,x);
//  fill(255);
//}

