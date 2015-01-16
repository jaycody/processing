/* jstephens 2014-11-17
 icm-15.5 : image processing with pixels
 */
PImage s01;
PImage s02;
PImage s03;
PImage blank;

void setup() {
  size(640, 480);
  s01 = loadImage("s01.png");
  s02 = loadImage("s02.png");
  s03 = loadImage("s03.png");
  blank = createImage(s01.width, s01.height, RGB);
}
void draw() {
 // image(blank, 0, 0, 640,480);
  loadPixels();
  blank.loadPixels();
  s02.loadPixels();
  for (int x = 0; x < blank.width; x++){
    for (int y = 0; y < blank.height; y++){
    int loc = x+y*blank.width;
    blank.pixels[loc] = s02.pixels[loc];
    }
  }
  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
    int loc = x+y*width;
    pixels[loc] = blank.pixels[loc];
    }
  }
  //blank.updatePixels();
  updatePixels();
  image(blank,10,10);
}

