//jason stephens
//icm week3 - using a state variable in conjunction with mousePressed

int x = 0;
int y = 0;

int speed = 2;
int state = 1;

void setup(){
  size(200,200);
  background(0);
}

void draw(){
  fill(255);
  rect(x,y,20,20);
  if (state == 1){
    x=x+speed;
    if (x>180){
      x=180;
      state = 2;
    }
  }
    else if (state == 2){
      y=y+speed;
      if (y>height-20){
        y=height-20;
        state=3;
      }
    }
    else if (state==3){
      x=x-speed;
      if (x<0){
        x=0;
        state=4;
      }
    }
    else if (state==4){
      y=y-speed;
      if (y<0){
        y=0;
        state=1;
      }
    }
    if (mousePressed == true){
      speed = speed*-1;
      if ((x<0)||(x>width-20)||(y>height-20)||(y<0)){
        speed = speed*-1;
      }
    }
}
