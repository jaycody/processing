//jason stephens
//exercise 5-2 making rollovers

float x = 100;
float y = 20;
float speed = 1;


void setup(){
  size(200,200);
  background(0);
}

void draw(){
  float r = random(0,255);
  float g = random(0,255);
  background(0);
  fill(0);
  rect(10,10,180,180);
  if ((mouseX>width/2)&&(mouseY<width/2)){
    background(255);
    ellipse(x,y,50,50);
    x = x+speed;
    if ((x>180)||(x<45)){
      speed = speed *-1;
    }
  }else if (mouseX<width/2) {
    background(0,0,255);
    fill(255,0,0);
    triangle(width/2,0,width,height,0,height);
  }
  if (mouseX<width/3){
    background(r,g,255-r);
  }
}

