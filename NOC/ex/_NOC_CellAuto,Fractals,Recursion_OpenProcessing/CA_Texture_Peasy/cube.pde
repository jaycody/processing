class Cube
{
  PVector initPos  = new PVector();
  PVector scaleRatio = new PVector();
  float[] coords = {
    /*+z front*/  -1,-1,1,1,-1,1,1,1,1,-1,1,1,
    /*-z back*/    1,-1,-1,-1,-1,-1,-1,1,-1,1,1,-1,
    /*+y bottom*/ -1,1,1,1,1,1,1,1,-1,-1,1,-1,
    /*-y top*/    -1,-1,-1,1,-1,-1,1,-1,1,-1,-1,1,
    /*+x right*/   1,-1,1,1,-1,-1,1,1,-1,1,1,1,
    /*-x left*/   -1,-1,-1,-1,-1,1,-1,1,1,-1,1,-1
  };
  
    
  Cube(PVector _initPos, PVector _scaleRatio)
  {
    initPos = _initPos;
    scaleRatio = _scaleRatio;
  }
   
  void build()
  {
    noStroke();
    noFill();
    for(int i = 0; i <= 60; i+=12){
        float cn  = map(i, 0, 60, 0, 5);
        textureMode(NORMALIZED);
        beginShape(QUADS);
        texture(automatas[(int) cn].atmt);
        vertex((coords[i]+initPos.x)*scaleRatio.x, (coords[i+1]+initPos.y)*scaleRatio.y,  (coords[i+2]+initPos.z)*scaleRatio.z, 0, 0);
        vertex((coords[i+3]+initPos.x)*scaleRatio.x, (coords[i+4]+initPos.y)*scaleRatio.y,  (coords[i+5]+initPos.z)*scaleRatio.z, 1, 0);
        vertex((coords[i+6]+initPos.x)*scaleRatio.x, (coords[i+7]+initPos.y)*scaleRatio.y,  (coords[i+8]+initPos.z)*scaleRatio.z, 1, 1);
        vertex((coords[i+9]+initPos.x)*scaleRatio.x, (coords[i+10]+initPos.y)*scaleRatio.y,  (coords[i+11]+initPos.z)*scaleRatio.z, 0, 1); 
        endShape(); 
      }  
     
  }
    
   
}

