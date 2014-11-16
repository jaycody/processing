// create the random acceleration class

class RandomAccelerator {
  
  PVector loc;
  PVector vel;
  PVector RanAcc;
  float topspeed;
  
  
  
  RandomAccelerator (PVector l, PVector v, PVector ra){
    loc = l.get();
    vel = v.get();
    RanAcc = ra.get();
    topspeed = 10;
    
  }
  
  // main functions
  void go () {
    update();
  checkedges();
render();
  }
  
  void update () {
    loc.add(vel);
    vel.add(RanAcc);
    vel.limit(topspeed);
    
