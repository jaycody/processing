// create Brownian Walker Class

// the following code comes from Processing examples

class BrownianWalker {
  
  int num = 2000;
  //int range = int(random(10,19));

  float[] ax = new float[num];
  float[] ay = new float[num];

  BrownianWalker() 
  {
    for (int i = 0; i<num; i++) 
    {
      ax[i] = width-width/4;
      ay[i] = height-height/4;
    }
  }

    void render ()
    {
      int range = int(random(1,20));
      // shift all elements 1 place to the left
      for(int i = 1; i<num; i++) {
        ax[i-1] = ax[i];
        ay[i-1] = ay[i];
      }
      
      //put a new value at the end of the array
      ax[num-1] +=random (-range, range);
      ay[num-1] +=random (-range, range);
      
//      ax[num-1] +=random (-range, range);
//      ay[num-1] +=random (-range, range);
      
      //constrain all points to the screen
      ax[num-1] = constrain(ax[num-1],0,width);
      ay[num-1] = constrain(ay[num-1],0,height);
      
      
      // draw a line connecting the points
      
      for (int i=1; i<num; i++) {
        float val = float(i)/num *204.0 +51;
        stroke(val);
        line(ax[i-1], ay[i-1], ax[i], ay[i]);
      }
    }
}
      

