//aquarium

float x = 100;
float y = 50;

//background fishes
float bottomfishx = 150;
float bottomfishy = 650; 

int grey = 150; 
int bluestroke1 = 40;
int bluestroke2 = 60;
int bluestroke3 = 180; 

float fishspeed = 8;
float topfishspeed = 8;
int flip = 1; 
int topflip = -1; 

void setup () {
  size (800,800);
  frameRate (30);
  //set all to center mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  smooth();
}

void draw() {
    
  background (81,198,250);
  drawFish(x,y);
  drawFish(200,150);
  moveFish();
}


void drawFish(float topfishx, float topfishy) {
  //gray fish top

  //top fin
  stroke(bluestroke1, bluestroke2, bluestroke3);
  fill(grey);
  strokeWeight(8);
  quad(topfishx-30*topflip,topfishy-26,topfishx+30*topflip,topfishy-26,topfishx+6*topflip,topfishy-46,topfishx-54*topflip,topfishy-46);
  strokeWeight (1);
  line (topfishx-15*topflip,topfishy-26,topfishx-34*topflip,topfishy-41);
  line (topfishx,topfishy-26,topfishx-19*topflip,topfishy-41);
  line (topfishx+15*topflip,topfishy-26,topfishx-4*topflip,topfishy-41);
}

void moveFish() {
  x = x - topfishspeed; 

  if (x > (width + 160) || x < -160) {
    topfishspeed = topfishspeed * -1;
    topflip = topflip * -1;
  }
}





