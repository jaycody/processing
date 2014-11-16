// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// PBox2D example

// A rectangular box
class Lollipop  {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;

  // Constructor
  Lollipop(float x, float y) {
    w = random(2,6);
    h = w*3;
    // Add the box to the box2d world
    makeBody(new Vec2(x,y),w,h);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }

  // Drawing the lollipop
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    rect(0,0,w,h);
    ellipse(0,-h,h,h);
    popMatrix();
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float w_, float h_) {
    
    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);


    // Define a polygon (this is what we use for a rectangle)
    PolygonDef sd = new PolygonDef();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    // Parameters that affect physics
    sd.density = 1.0f;
    sd.friction = 0.3f;
    sd.restitution = 0.5f;
    
    // Define a circle
    CircleDef cd = new CircleDef();
    // Offset its "local position" (relative to 0,0)
    Vec2 offset = new Vec2(0,-h);
    cd.localPosition = box2d.vectorPixelsToWorld(offset);
    cd.radius = box2d.scalarPixelsToWorld(h_/2);
    cd.density = 1.0f;
    cd.friction = 0.3f;
    cd.restitution = 0.5f;
    

    // Attach both shapes!
    body.createShape(sd);
    body.createShape(cd);
    body.setMassFromShapes();

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-5,5),random(2,5)));
    body.setAngularVelocity(random(-5,5));

  }

}



