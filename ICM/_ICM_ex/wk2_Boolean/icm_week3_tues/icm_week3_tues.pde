float x = 10;
float y = 10;
float xspeed = 2;
float yspeed = 1.3;

boolean moving = false;

void setup() {
  size(400,300);
}

void draw() {
  background(255);
  if (moving) {
    x = x + xspeed;
    y = y + yspeed;
  }

  fill(0);
  rectMode(CENTER);
  rect(x,y,50,50);

  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }

  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
}

void mousePressed() {
  moving = !moving;
//  if (moving == true) {
//     moving = false;
//    } else if (moving == false) {
//      moving = true;
//  /  }
}

