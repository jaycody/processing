SquareManager manager;
 
void setup()
{
  size(1000,1000);
 
  manager = new SquareManager();
 
  stroke(255,255,255);
 
  background(0);
   
  makeSquares(300);
}
 
void makeSquares(int x)
{
    for(int i = 0; i < x; i++)
  {
     // guarantee the creation of the x number of squares
    while(true)
    {
      int rx = (int)random(width);
      int ry = (int)random(height);
      int rs = (int)random(500);
 
      fill(0);
      if(manager.createSquare(rx,ry,rs))
      {
        break;
      }
    }
  }
}
 
void draw()
{
 
}
 
void mouseClicked()
{
  background(0);
  manager = new SquareManager();
  makeSquares(300);
}

