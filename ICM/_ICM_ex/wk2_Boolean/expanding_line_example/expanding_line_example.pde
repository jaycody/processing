float x = 200;
float y = 400;

float spandex = 50;

float yspeed; 

void setup() {
  size(400,800);
  yspeed = random(-5,5);
}

void draw() {
  background(255);
  stroke(0);

  line(x-spandex,y,x+spandex,y);
  line(x-spandex,y+10,x+spandex,y+10);
  
  y = y - yspeed;
  //spandex = spandex + 0.3;
}

