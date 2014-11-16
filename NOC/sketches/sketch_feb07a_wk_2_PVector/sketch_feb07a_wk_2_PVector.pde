// jason stephens
// nature of code
// wk_2 PVectors


Thing t;
Thing t1;

boolean showVectors = true;  // this activates the if statement from class


void setup() {
  size (800,800);
  fill (0);
  background (0);

  // create the THING object
  // this is what shiffman means by objects within objects::::
  PVector a = new PVector (0.0,.05); //only on the y-axis is there acc
  PVector v = new PVector (1, 0);
//  PVector l = new PVector (width/2, height/2);
PVector l = new PVector (random(width), 0);
//PVector l = new PVector (mouseX, mouseY);
PVector d = new PVector (0.00,0.002);
  t = new Thing(l,v,a,d);
  
}

void draw() {
  //background (0);

  // run the thing object

  t.go ();
}

// renders a vector object "v" as an arrow and a location "loc"
void drawVector(PVector v, PVector loc, float scayl) {
  pushMatrix();
  float arrowsize = 4;
  // Translate to location to render vector
  translate(loc.x,loc.y);
  stroke(255);
  // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading2D());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.mag()*scayl;
  // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0,0,len,0);
  line(len,0,len-arrowsize,+arrowsize/2);
  line(len,0,len-arrowsize,-arrowsize/2);
  popMatrix();
}



