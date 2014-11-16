class PerlinWalker {

  float x, y, a;
  float vx = 2;
  float gravityX = 3;
  float vy = 1;
  float gravityY = .03;
  float boundry;
  float boundryOff = 0;
  float boundry2;
  float boundryOff2 = 0;
  // gravity is acceleration in the y axis
  // using standard physics abbeviations

  // Constructor

  PerlinWalker()
  {
    x = (width/4);
    y = (height/4);
    boundry = width/2;
  }

  void render ()
  {
    stroke(0);
    fill(255,0,255);
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

    // using Perlin noise to constrain falling bounce
    x = x + vx;
    //boundryOff =.8;  // why is the noise always the same here if boundryOff remains constant

    //boundry = noise(boundryOff) * width/2;

    if ((x>boundry) && (vx>0)) {  //trick learned with arduino buttons, only flip states if its an opposite state
      vx = vx * -1; 
      boundry = noise(boundryOff) * width/2;  // if exceeds the boundry, then repopulate boundry, but only then, not before
      boundryOff = boundryOff + .8;
      //gravityX = gravityX * -1;
    }
    
      if ((x<boundry) && (vx<0))
    {
      vx = vx * -1;
      boundry = noise(boundryOff) * width/2;
      //boundryOff = boundryOff + .8;
      //if ((x<random(0,width/4)) && (vx < 0)) {
    }


//    if ((x<boundry2) && (vx<0))
//    {
//      vx = vx * -1;
//      boundry2 = noise(boundryOff2) * width/4;
//      boundryOff2 = boundryOff2 + .8;
//      //if ((x<random(0,width/4)) && (vx < 0)) {
//    }


    // using random to constrain falling bounce
    //    x = x+vx;
    //    if ((x>random(width/4,width/2)) && (vx>0)) {
    //      vx = vx * -1; 
    //      //gravityX = gravityX * -1;
    //    }
    //
    //    if ((x<random(0,width/4)) && (vx < 0)) {
    //      vx = vx * -1;  
    //    }




    print("boundry = ");
    print(boundry);
    print("  boundryOff = ");
    println(boundryOff);
  }
}

