//// now wittness the firepower of this fully armed and operational ARRAY of Gravity Trianbles
//
//// make and instance of the class GT
//
//GravityTriangle myGT;  //declare "myGT" as an instance of GravityTriangle
//
//int numTriangles = 10;  //declare "numTriangles" variable and initialize it at 100
//
//GravityTriangle[] manyGTs = new GravityTriangle[numTriangles];
//
//
//void setup(){
//  size (1024,1024);
//  
//  //make 100 GravityTriangles and put them in an array
//  
//  for (int i=0;i<manyGTs.length;i++){
//    manyGTs[i] = new GravityTriangle(random(255));// HERE is where the variable gets passed into the object
//  }
//}
//
////now draw every single one of those GTs
//void draw(){
//  background(255);
//  for (int i=0;i<manyGTs.length;i++){
//    manyGTs[i].drawTriangle();
//    //manyGTs[i].drawTrackers();
//  }
//}
//  


//Processing Kung Fu - Do it again, and again and again
//GravityTriangle myGT; // declare new object from the class 
//
//int numTriangles = 20;  // create variable for the number of triangles
//
//GravityTriangle[] manyGTs = new GravityTriangle[numTriangles]; // declare new array of objects from the class
//
//
//void setup(){
//  size (1024,768);
//  //make 100 triangle objects and put each one into the array manyGTs
//  
//  for (int i=0;i<manyGTs.length;i++){
//    manyGTs[i] = new GravityTriangle(random(255));  // loop creating object in each index of array manyGTs
//  }
//}
////now draw every instance from the array
//
//void draw(){
//  background(0);
//  for (int i = 0; i<manyGTs.length; i++){
//    manyGTs[i].drawTriangle();
//  }
//}

//AGAIN

GravityTriangle myGT; //declare the new object from the class

int numberTriangles = 5; // create the length of the array to be created

GravityTriangle[] manyGTs = new GravityTriangle[numberTriangles];

void setup() {
  size (1200,1200);
  // create n objects and populate each index of the array
  for (int i = 0; i<manyGTs.length; i++) {
    manyGTs[i] = new GravityTriangle(0);
  }
}

void draw() {
  background (255); //(random(255));
  stroke(0);
  strokeWeight(3);
 // line(manyGTs[manyGTs.length-1].x1,manyGTs[manyGTs.length-1].y1,manyGTs[1].x1,manyGTs[1].y1);
  // strokeWeight(0);
  //stroke(255);
  for (int i=0;i<manyGTs.length; i++) {
    manyGTs[i].drawTriangle();
    manyGTs[i].drawTrackers();
    // line(manyGTs[i].x1,manyGTs[i].y1,manyGTs[manyGTs.length-1].x1,manyGTs[manyGTs.length-1].y1);
   // line(manyGTs[i].x1,manyGTs[i].y1,manyGTs[i].x1,manyGTs[i].y1);
    for (int q=0; q<manyGTs.length;q++) {
      strokeWeight(3);
      stroke(255,0,0);

      line(manyGTs[i].x1,manyGTs[i].y1,manyGTs[q].x1,manyGTs[q].y1);
    }
    strokeWeight(3);
    stroke(0);
  }
}

