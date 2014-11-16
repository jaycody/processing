// Attraction Array with Oscillating objects around each thing
// Daniel Shiffman <http://www.shiffman.net>
// Nature of Code, Spring 2009

class Oscillator {
  
  // Because we are going to oscillate along the x and y axis we can use PVector for two angles, amplitudes, etc.!
  PVector theta;
  PVector amplitude;
  PVector thetaVel;

  // This is where we'll stored the oscillation offset
  PVector offset;

  Oscillator() {
    
    // Initialize randomly
    theta = new PVector(0,0);
    amplitude = new PVector(random(20),random(20));
    thetaVel = new PVector(random(0.5),random(0.5));

    offset = new PVector(0,0);

  }

  // Update theta and offset
  void update() {
    theta.add(thetaVel);
    offset.x = sin(theta.x) * amplitude.x;
    offset.y = cos(theta.y) * amplitude.y;
  }

  // Display based on a location
  void display(PVector loc) {
    stroke(0);
    fill(175);
    line(loc.x,loc.y,loc.x+offset.x,loc.y+offset.y);
    ellipse(loc.x+offset.x,loc.y+offset.y,8,8);
  }
}


