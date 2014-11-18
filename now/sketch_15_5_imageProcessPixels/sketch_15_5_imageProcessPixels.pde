/* jstephens 2014-11-17
 icm-15.5 : image processing with pixels
 */

PImage shiffman01;

void setup() {
  size(640, 480);
  shiffman01 = loadImage("s01.png");
}

void draw() {
  image(shiffman01, 0, 0, 640,480);
  //  loadPixels();
  //  updatePixels();
}

