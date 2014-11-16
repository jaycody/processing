int x=0;
int y=0;
int a=0;
int speed=1;

void setup() {
  size (500,500);
}

void draw() {
  background (255);
  for (x=-50;x<width+50;x=x+50) {
    for (y=0;y<height;y=y+50) {

      drawline(x,y,a);
    }
  }

  a=a+speed;
  if ((a >50)||(a<0)) {
    speed = speed *-1;
  }
}

  void drawline(int x, int y, int a) {
    strokeWeight(1);
    stroke(255,0,0);
   line (x,y,x+50,y+a);
   stroke(0,0,255);
   line (x,y+50,x+50,y+50-a);
  }

