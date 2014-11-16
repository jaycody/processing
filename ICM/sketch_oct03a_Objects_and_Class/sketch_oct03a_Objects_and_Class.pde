//Jason Stephens
//Object Oriented Programming practice 1

//1.class declaration
//2.properties declaration
//3.constructors
//4.methods


//1.class declaration
class Seekers {

  //2.properties declaration
  float circleX;
  float circleY;
  float circleD;
  float lineX;
  float lineY;
  float lineA;
  float lineB;
  float triA;
  float triB;
  float triC;
  float triD;
  float triE;
  float triF;

  //3.constructors
  Seekers ourSeeker = new Seekers();

  //3a_constructors
  Seekers();
  {
  }

  //3b-constructors
  Seekers(float circleX, float circleY, float circleD) {
    //initialize proerties
    _circleX = circleX;
    _circleY = circleY;
    _circleD = circleD;
  }


  //3c-constructors
  Seekers(float circleX, float circleY, float circleD, float triA, float triB, float triC, float triD, float triE, float triF) {
    _circleX = circleX;
    _circleY = circleY;
    _circleD = circleD;
    _triA = triA;
    _triB = triB;
    _triC = triC;
    _triD = triD;
    _triE = triE;
    _triF = triF;
  }

  //4.Methods
  void drawCircle(

