int numSquares=144;
Square[] s=new Square[numSquares];
 
void setup()
{
  background(0);
  size(372,372);
  smooth();
  colorMode(HSB,360,100,100,255);
 
  for(int i=0;i<numSquares;i++)
  {
    s[i]=new Square(width/2,height/2,20);
  }
//  frameRate(60);
}
 
float mx=0;
float angle=0;
float angle2=0;
float x=0;
float y=0;
float k=0;
float sine;
float cosine;
float tangent;
float arctan;
float purple;
float sat;
float sineC=0;
float randomizer=0;
int rotMode=1;
float cMode=1;
float xNoise=0;
float yNoise=0;
float v=180;
 
 
void draw()
{
  background(255,0,100,0);
  rectMode(CENTER);
  int rows=12;
  int cols=12;
 
  k+=PI/180;
  if(k>TWO_PI){
    k=0;
    randomizer=random(10);
  }
  sine=sin(k);
  cosine=cos(k);
  tangent=tan(k);
  arctan=atan(k);
  sineC=map(sine,-1,1,0,360);
 
  if(rotMode==1)
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        coloring(i,j);
        s[i+j].spin(i*30,j*30,0);
        s[i+j].update(20,20,20);
        s[i+j].display();
      }
    }
  }
 
  if(rotMode==2)
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        coloring(i,j);
        s[i+j].spin(i*30+12,j*30+12,(i)*k);
        s[i+j].update(8,8,20);
        s[i+j].display();
      }
    }
  }
 
  if(rotMode==3)
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        coloring(i,j);
        s[i+j].spin(i*30+12,j*30+12,(i+j)*k);
        s[i+j].update(8,8,20);
        s[i+j].display();
      }
    }
  }
 
  if(rotMode==4)
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        coloring(i,j);
        s[i+j].spin(i*30+20,j*30+20,0);
        s[i+j].update(sine*int(random(0,4)),sine*int(random(0,4)),int(random(19,22)));
        s[i+j].display();
      }
    }
  }
 
  if(rotMode==5)
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        coloring(i,j);
        s[i+j].spin(i*i*j*cosine/10+width/2-width*sine/2.2,i*j*j*sine/10+height/2-height*cosine/2.2,0);
        s[i+j].update(i*i*sine*2,j*j*cosine*2,20);
        s[i+j].display();
      }
    }
  }
 
  if(rotMode==6)
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        coloring(i,j);
        s[i+j].spin(i*i*j*cosine/10+width/2-width*i*tan(k+PI/2)/80-width*sine/20,i*j*j*sine/10+height/2+height*i*cosine/15-height*cosine/2.2,0);
        s[i+j].update(i*i*sine*2,j*j*cosine*2,20);
        s[i+j].display();
      }
    }
  }
 
  if(rotMode==7)
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        coloring(i,j);
        s[i+j].spin(i*i*j*cosine/10+width/2-width*i*tan(k+PI/2)/80-width*cosine*sine/4,i*j*j*sine/10+height/2+height*i*cosine/15-height*cosine/2.2,sine*cosine*tangent*TWO_PI);
        s[i+j].update(i*i*sine*2,j*j*cosine*2,20);
        s[i+j].display();
      }
    }
  }
   
  if(rotMode==8)
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        coloring(i,j);
        s[i+j].spin(width/2, height/2, i*j*sine*cosine*TWO_PI/70);
        s[i+j].update(i*i*sine*1.25,j*j*cosine*1.25,20);
        s[i+j].display();
      }
    }
  }
 
  if(rotMode==9)
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        coloring(i,j);
        s[i+j].spin(width/2, height/2, i*j*sine*TWO_PI/70);
        s[i+j].update(i*i*sine*1.4,j*j*cosine*1.4,20);
        s[i+j].display();
      }
    }
  }
   
    if(rotMode==10)
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        coloring(i,j);
        s[i+j].spin(width/2, height/5, k);
        s[i+j].update(i*sine*18, j*cosine*18, map(i*j,0,144,20,100));
        s[i+j].display();
      }
    }
  }
   
  if(rotMode==11)
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        coloring(i,j);
        s[i+j].spin(width/1.4, height/5, i*j*TWO_PI/500+k);
        s[i+j].update(i*i*sine*1.8, j*j*cosine*1.8, map(i*j,0,144,10,80));
        s[i+j].display();
      }
    }
  }
   
  if(rotMode==12)
  {
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<cols;j++)
      {
        coloring(i,j);
        s[i+j].spin(mouseX, mouseY+sine*TWO_PI, k*(i+j)/20);
      if(i!=0&&j!=0)
      {
        s[i+j].update(i*i*sine*2,j*j*sine*2,20);
        s[i+j].display();
      }
     }
    }
  }
  /*  if(frameCount%2==0 && frameCount<=180)
   {
   saveFrame("x-####.gif");
   }*/  //image capture code
}
 
void coloring(int ci,int cj)
{
  if(cMode==1)
  {
    s[ci+cj].colors(0,3,sineC,100,100,100);
  }
  if(cMode==2)
  {
    s[ci+cj].colors(0,3,sineC,100,100,360);
  }
  if(cMode==3)
  {
    s[ci+cj].colors(1,1,0,0,70,360);
  }
  if(cMode==4)
  {
    s[ci+cj].colors(1,1,0,0,0,0);
  }
    if(cMode==5)
  {
    s[ci+cj].colors(0,2,0,0,0,0);
  }
    if(cMode==6)
  {
    s[ci+cj].colors(0,3,0,0,0,0);
  }
    if(cMode==7)
  {
    s[ci+cj].colors(0,5,0,0,100,360);
  }
      if(cMode==8)
  {
    s[ci+cj].colors(0,3,map(mouseX*mouseY,0,height*width,0,360),100,100,360);
  }
      if(cMode==9)
  {
    s[ci+cj].colors(0,5,map(ci*cj,0,144,0,360),100,100,100);
  }
      if(cMode==10)
  {  
    s[ci+cj].colors(0,3,map(ci,0,12,0,360),100,100,100);
  }
      if(cMode==11)
  {
    s[ci+cj].colors(0,3,0,0,int(random(0,101)),100);
  } 
}
 
void keyPressed()
{
  if(keyPressed==true)
  {
    cMode++;
    if(cMode>11)
    {
      cMode=1;
    }
  }
}
 
void mousePressed()
{
  rotMode++;
  if(rotMode>12)
  {
    rotMode=1;
  }
}
