//// build the PerlinWalker class
//
//class PerlinWalker {
//  
//  float x,y;
//  
//  PerlinWalker() {
//   
//    x = width/2;
//    y = height/2;
//    
//  }
//  
//  void render () {
//    fill (255,0,255);
//   rectMode(CENTER);
//    rect(x-50,y-50, 40,20);
//    }
//    
//}

//class PerlinWalker {
//
//  float xoff = 30;
//  float yoff = 20;
//
//  void render() 
//  {
//    //background(204);
//    stroke(255);
//
//    fill(255);
//    xoff = xoff + .01;
//    float nx = noise(xoff) *width;
//    float ny = noise(yoff) *height;
//    line(nx, 0, nx,height);
//  }
//  float noiseScale=0.02;
//  void walk() {
//    //background(0);
//    for(int x=0; x < width; x++) {
//      float noiseVal = noise((mouseX+x)*noiseScale, 
//      mouseY*noiseScale);
//      stroke(noiseVal*255);
//      line(x, mouseY+noiseVal*80, x, height);
//    }
//  }
//}

