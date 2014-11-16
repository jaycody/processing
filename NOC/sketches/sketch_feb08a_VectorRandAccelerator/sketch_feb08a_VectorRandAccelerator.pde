// jason stephens
// nature of code
// wk_2 PVectors with Random Acceleration

RandomAccelerator R;
RandomAccelerator R1;
RandomAccelerator R2;

Perlin P;
Perlin P1;
Perlin P2;

MouseAccelerator M;
MouseAccelerator M1;
MouseAccelerator M2;


void setup() {
  size (800,800);
  fill (0);
  background (0);

  // location, velocity and random acceleration for Random Accelerator

  PVector l = new PVector (random(width), 0);
  PVector v = new PVector (1, 0);

  PVector r = new PVector (random(-1,1), random(-1,1));
  r.normalize();
  //racc.mult(.5); // scaling to a constant value
  r.mult(random(2)); // scaling to a random


  R = new RandomAccelerator(l,v,r);
  R1 = new RandomAccelerator(l,v,r);
  R2 = new RandomAccelerator(l,v,r);

  // meanwhile we have Perlin Acceleration
  P= new Perlin(random (1,1000), random (1,1000));
  P1 = new Perlin(random (1,1000), random (1,1000));
  P2 = new Perlin(random (1,1000), random (1,1000));
  
  M = new MouseAccelerator(random (1,1000), random (1,1000));
  M1 = new MouseAccelerator(random (1,1000), random (1,1000));
  M2 = new MouseAccelerator(random (1,1000), random (1,1000));
}


void draw () {
  R.go();
  R1.go ();
  R2.go ();
  P.go();
  P1.go();
  P2.go();
  M.go();
   M1.go();
    M2.go();
}



