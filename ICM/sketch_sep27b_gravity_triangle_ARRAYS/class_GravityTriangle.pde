//como Gravity's Rainbow, except this is GRAVITY TRIANGLE

//the class of GravityTriangle has exactly 1 variable to pass from the function
//into the object and that is the degree of opacity [where 0 = transparent]

//there are 2 functions within class
//void drawTrackers() which draw the ellipses that keep track of each vertex
//void drawTriangle() which does the obvious

class GravityTriangle {

  //attributes:  things the GravityTriangle has
  // setup for 1st x,y (gravity, speed, cordinates)
  float x1; //declare x1 for initial starting point dependent on width
  float y1 = 0;//y1 initial starting point
  float speedX1 = random(-2,2);//horizontal component of velocit for vertex 1
  float speedY1 = random(1,2);// vertical component of velocity for vertex 1
  float dampenX1 = random(-1.05,-1.5);
  float dampenY1 =random(-.9855,-.99999);
  float gravity1 = random(.05,.08);
  // setup for 2nd xy (gravity, speed, coordinates)
  float x2;  //decalre x2 for starting point dependent on setup width
  float y2 = 0;
  float speedX2 = random(-2,2);
  float speedY2 = random(1,2);
  float dampenX2 =random(-1.05,-1.15);
  float dampenY2 =random(-.98,-.9999);
  float gravity2 = random(.05,.08);

  // setup for 3nd xy (gravity, speed, coordinates)
  float x3;  //declare x3 for starting point dependent on setup width
  float y3 = 0;
  float speedX3 = random(-2,2);
  float speedY3 = random(1,2);
  float dampenX3 = random(-1.05,-1.15);
  float dampenY3=random(-.9855,-.9999);
  float gravity3 = random(.05,.08);

  float cr,cg,cb,ca;

  //CONSTRUCTOR:  this creates a GravityTriangle based on the variables I define
  GravityTriangle() {

    //ca=_ca; //which means that the only variable I am passing in is the level of opacity
    cr=random(255);
    cg=random(255);
    cb=random(255);
    ca=random(255);
    x1=random(width);
    x2=random(width);
    x3=random(width);
  }
  void drawTrackers() {  //for tracking purposes
    fill(255,0,0);
    ellipse (x1,y1,10,10);
    fill(0,255,0);
    ellipse (x2,y2,40,40);
    fill(0,0,255);
    ellipse (x3,y3,80,80);
  }

  void drawTriangle() {
    smooth();
    fill(cr,cg,cb,ca);
    triangle(x1,y1,x2,y2,x3,y3);


    //creating the moveTriangle function
    // bouncing for 1st xy
    y1=y1+speedY1;//add speed to location
    x1=x1+speedX1;
    speedY1=speedY1+gravity1;//add gravit to speed
    //setup for 2nd xy
    y2=y2+speedY2; //add speed to the y2 ooordinates
    speedY2=speedY2+gravity2;
    x2=x2+speedX2; 
    //setup for 3nd xy
    y3=y3+speedY3; //add speed to the y2 ooordinates
    speedY3=speedY3+gravity3;
    x3=x3+speedX3;
    //creating the bounceTriangle function
    //if the triangle reaches the bottom reverse the speed
    //x1,y1 check bounce and dampen
    if (y1>height) {
      speedY1=speedY1*dampenY1; // change direction with dampening
    }
    if ((x1>width)||(x1<0)) {
      speedX1=speedX1*dampenX1; //change direction with dampen
    }
    //x2,y2 check bounce and dampening
    if (y2>height) {
      speedY2=speedY2*dampenY2;  //change direction with dampen
    }
    if ((x2>width)||(x2<0)) {
      speedX2=speedX2*dampenX2;  //change direction with dampen
    }
    //x3,y3 check bounce and dampen
    if (y3>height) {
      speedY3=speedY3*dampenY3;  //change direction with dampen
    }
    if ((x3>width)||(x3<0)) {
      speedX3=speedX3*dampenX3; // change direction with dampen
    }
  }
}

