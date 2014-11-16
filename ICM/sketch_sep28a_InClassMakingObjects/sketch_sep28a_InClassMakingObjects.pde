Seeker b1;
Seeker b2;

void setup(){
  size(400,400);
  b1 = new Seeker(100,90,20);  //assigning a value to the constructor
  b2 = new Seeker();
}

void draw (){
  background(255);
  b1.display();
  b1.move();
  b2.display();
  b2.move();
}
