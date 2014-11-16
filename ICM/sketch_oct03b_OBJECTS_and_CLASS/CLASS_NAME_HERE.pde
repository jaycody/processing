//DEFINING A CLASS in second tab
//DEFINE A CLASS BELLOW THE REST OF PROGRAM
//PLACE CLASS IN SEPARATE TAB WITH NAME OF CLASS FOR TAB
//1.class declaration  (aka NAME)
//2.properties declaration   (aka DATA)
//3.constructors
//4.methods


//1.Class declaration (NAME)
class Car {
  
  // 2.property delcaration (aka DATA, aka Variables of the Object)
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  //  3. Constructors:  these are the instructions for creating the object itself
  Car(){
    c = color(255);
    xpos = width/2;
    ypos = height/2;
    xspeed = 1;
  }
  
  
  //  4. Methods (aka FUNCTIONS)
  void display(){
    // the car looks like a square
    rectMode (CENTER);
    fill (c);
    rect(xpos,ypos,20,10);
  }
  
  
  // 4. METHODS (aka Functions)
  void move(){
    xpos = xpos + xspeed;
    if (xpos>width){
      xpos = 0;
    }
  }
}
