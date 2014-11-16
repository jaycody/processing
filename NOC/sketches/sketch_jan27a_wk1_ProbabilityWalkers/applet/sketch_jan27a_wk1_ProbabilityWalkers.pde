//  Jason Stephens
//  Nature of Code
//  Probability Walkers
//  Exploring various techniques for informing the random function
//  Random - Guassian - Monte Carlo - Perlin Noise


//  1.  build a random walker class
//  2.  build a GuassianWalker class
//  3.  build a MonteCarloWalker class
//  4.  build a PerlinNoiseWalker class

// create instances of each class

//RandomWalker rw;
GuassianWalker gw;
//MonteWalker mw;
PerlinWalker pw;
BallWalker bw;
BrownianWalker brw;

void setup() {
  size (400,400);
  frameRate(30);
  background(0);
  
  // create a RandomWalker Object
  //rw = new RandomWalker();
  
  // create a GuassianWalker Object
  gw = new GuassianWalker();
  
  // create an instance of the MonteWalker
 // mw = new MonteWalker();
  
  // create an instance of the PerlinWalker
 pw = new PerlinWalker();
  
  // create an instance of BallWalker
  bw = new BallWalker();
  
  //creat an instance of Brownian Walker
  brw = new BrownianWalker ();
  
}

void draw() {
  //background (0);
  
   // render the Brownian object
  //brw.render();
  
   // render the Ballkwalker object
  //bw.render();
  
  // run the walker object
 // rw.walk();
 // rw.render();
  
  // run the GuassianWalker object
// gw.render();
// gw.walk();
// gw.bounce();
  
  // render the MonteWalker Object
 // mw.render();
  
  // render the PerlinWalker object
 pw.render();
  pw.walk();
   pw.render();
  pw.walk();
   //pw.render();
  //pw.walk();
  
  // render the Ballkwalker object
  bw.render();
  bw.walk();
   bw.render();
  bw.walk();
   //bw.render();
  //bw.walk();
  

}




