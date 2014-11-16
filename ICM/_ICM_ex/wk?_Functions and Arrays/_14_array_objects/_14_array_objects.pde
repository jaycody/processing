// Daniel Shiffman
// <http://www.shiffman.net>

// Array of objects
// Note how the Car class hasn't changed!
// Also note how we are using multiple tabs to organize our code
 
// An array of "Cars" with 20 spots
Car[] cars = new Car[20];

void setup() {
  size(200,200);
  for (int i = 0; i < cars.length; i++) {
    // Creating the objects by call the constructor
    // Note the use of 4 parameters -- color, x position, y position, speed, size
    cars[i] = new Car(color(i*10),0,i*10,i*0.2+1,i+2);
  }
}

void draw() {
  framerate(30);
  background(100);
  // Calling functions "render" and "drive" for each car
  for (int i = 0; i < cars.length; i++) {
     cars[i].drive();
     cars[i].render(); 
  }
}



