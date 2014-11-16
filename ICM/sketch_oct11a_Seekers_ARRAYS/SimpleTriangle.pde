//declare class name

class SimpleTriangle{
  color c;
  stroke st;
  strokeWeight sw;
  float aPos;
  float bPos;
  float cPos;
  float dPos;
  float ePos;
  float fPos;
  float xSpeed;
  float ySpeed;
  
  
  //Constructor
  SimpleTriangle(float c_, float st_, float sw_, float aPos_, float bPos_, float cPos_, float dPos_, float ePos_, float fPos_, float xSpeed_, float ySpeed_){
    c = c_;
    st = st_;
    sw = sw_;
    aPos = aPos_;
    bPos = bPos_;
    cPos = cPos_;
    dPos = dPos_;
    ePos = ePos_;
    fPos = fPos_;
    xSpeed = xSpeed_;
    ySpeed = ySpeed_;
  }
  
  void moveSimpleTriangle(){
    aPos = aPos + xSpeed;
    bPos = bPos + ySpeed;
  
