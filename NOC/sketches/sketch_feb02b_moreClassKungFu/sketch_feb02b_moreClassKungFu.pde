// Jason Stephens
// Nature of Code
// wk-2 PVectors version of a random walker



/*gong to make another random walker class using noise
then going to translate this new random walker into PVector
This entity is going to be a circle with a radius that
changes with perlin noise.
*/

Eye MyEye;
Eye MyEye2;

void setup () {
  size (400,400);
  background (0);
  fill(255);
  
  // create new instance
  MyEye = new Eye(width/2,height/2,50,255,100);
  MyEye2 = new Eye(width/2,height/2,40,150,200);
  
}

void draw(){
  //background(0);
  
  MyEye.look();
  MyEye2.look();
}
  
