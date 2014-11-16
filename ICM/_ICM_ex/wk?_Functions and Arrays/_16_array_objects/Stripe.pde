class Stripe {
  float x;      // horizontal location of stripe
  float speed;  // speed of stripe
  
  Stripe() {
    x = 0;              // All stripes start at 0
    speed = random(2);  // All stripes have a random positive speed
  }

  // Draw stripe
  void render() {
    fill(255,100);
    noStroke();
    rect(x,0,10,height);
  }

  // move stripe
  void move() {
    x += speed;
    if (x > width+20) x = -20;
  }


}
