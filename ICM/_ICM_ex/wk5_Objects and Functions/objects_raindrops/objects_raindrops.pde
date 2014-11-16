Raindrop drop1;
Raindrop drop2;

void setup() {
  size(400,300);
  drop1 = new Raindrop(100,50);
  drop2 = new Raindrop(150,100);
}

void draw() {
  background(255);
  drop1.fall();
  drop1.display();
  drop1.stop();

  drop2.fall();
  drop2.display();
  drop2.stop();

}


