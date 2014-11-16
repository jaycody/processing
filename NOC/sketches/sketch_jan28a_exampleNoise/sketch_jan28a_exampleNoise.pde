// Jason Stephens
// Nature of Code
// wk 1  NOISE, Random Walkers, Probabilities, Monte Carlos and such

// the following is an example taken from the book Processing for Virtual Artist

float NoiseScale = 0.005;
float NoiseOffSetX, NoiseOffSetY;


void setup () {
  size (800,600, P2D);
  background (255);
  smooth();
  noFill();
  stroke (0,0,0,32);
  for (int i = 0; i<300; i++) {
    NoiseOffSetX +=5;
    NoiseOffSetY += 7.1;
    drawOneStream();
  }
}

void drawOneStream() {
  float px = 0;
  float py = height/2.0;
  float vx = 1;
  float vy = 0;
  int pcnt = 0;
  
  while ((px>=0) && (px<width) && (py<height) && (py>=0)) {
    point (px, py);
    float xNoise = noise((pcnt+NoiseOffSetX) * NoiseScale);
    float yNoise = noise((pcnt+NoiseOffSetY) * NoiseScale);
    vx = ((2*vx) + 1 + map(xNoise, 0, 1, -1, 1))/4.0;
    vy = ((3*vy) + map(yNoise, 0,1,-1,1))/4.0;
    px += vx;
    py += vy;
    pcnt ++;
  }
}

