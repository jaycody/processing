int[] fibs;
final int FIBLIMIT = 47; // 93;
int nextFib = 1;
long etime;
long ftime = 1000;
int oldFib = 3;


int nextFib(){
  if(nextFib >= FIBLIMIT)
    nextFib = 1;
  return fibs[nextFib++];
}

void makeFibs(){
  fibs = new int[FIBLIMIT];
  fibs[1] = fibs[2] = 1;
  for(int i = 3; i < FIBLIMIT; i++){
    fibs[i] = fibs[i-1] + fibs[i-2];
   }
  nextFib = 5;
}

void setup(){
    size(323,200);
  makeFibs();
  etime = millis();

  translate(height/(sqrt(5)+1)/2,0);
  scale(height);
  //noStroke();  
  smooth();
}

void draw(){
 // background(0);
  if(millis() - etime > ftime){
   
   int tempFib = nextFib();
  
   float phi = (float(tempFib) / float(oldFib));
   println(phi);
  
  pushMatrix();  
  fill(2/10*255);
  rect(0,0,1,1);
  fill(255,255,0,150);
  arc(0,0,2,2,0,PI/2);
  scale(1/phi);
  rotate(PI/2);
  translate(1/phi,0);   
  popMatrix(); 
   oldFib = tempFib;
  

    etime = millis();
  
  }
}
 
