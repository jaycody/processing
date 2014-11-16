///* the first of several classes for this assignment
// RandomWalker */
//
//
//// now let's see how do we create a CLASS?
//
//class RandomWalker {
//
//  float x,y;
//
//  RandomWalker() {
//    x = width/2;
//    y = height/2;
//  }
//
//  void render() {
//    stroke(0);
//    fill(255,0,0);
//    rectMode(CENTER);
//    ellipse(x,y,40,40);
//  }
//  
//  
//  //  Randomly move up, down, left, right, or stay in one place
//  void walk() {
//    float vx = random(-2,2);
//    float vy = random(-2,2);
//    x += vx;
//    y += vy;
//    
//    // Stay on the screen
//    x = constrain(x,0,width-1);
//    y = constrain(y,0,height-1);
//  }
//}

