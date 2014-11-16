// write a standard ball class with bounce and gravity


class BallWalker {

  float x, y, a;
  float vx = 2;
  float gravityX = 3;
  float vy = 1;
  float gravityY = .03;
  // gravity is acceleration in the y axis
  // using standard physics abbeviations

  // Constructor

  BallWalker()
  {
    x = (width/2);
    y = (height/2);
  }

  void render ()
  {
    stroke(0);
    fill(255,255,0);
    rectMode(CENTER);
    ellipse(x, y, 10,10);
  }

  void walk () { // random fall constraining random function

    // vertical component of velocity
    y = y+vy;
    vy = vy+gravityY;

    if (y>height +25) {
      y = -25;
      vy=1;
    }



    x = x+vx;
    if ((x>random(width/2,width)) && (vx>0)) {
      vx = vx * -1; 
      //gravityX = gravityX * -1;
    }

    if ((x<random(0,width/2)) && (vx < 0)) {
      vx = vx * -1;
      //gravityX=gravityX * -1;
    }

    //  if (vx < 0 ) {
    //    x = vx + gravityX;
    //  }
    //  if (vx > 0) {
    //    x = vx -gravityX;
    //  }
    //vx = vx + gravityX;
    //if (gravityX>1)
    //gravityX = gravityX*-1;
//    print("gravityX = ");
//    print(gravityX);
//    print("  y = ");
//    println(y);
  }
}

