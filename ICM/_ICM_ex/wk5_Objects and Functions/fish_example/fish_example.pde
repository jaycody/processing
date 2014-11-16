//aquarium

//background fishes
float bottomfishx = 150;
float bottomfishy = 650; 

float topfishx = 650;
float topfishy = 150; 


int grey = 150; 
int bluestroke1 = 40;
int bluestroke2 = 60;
int bluestroke3 = 180; 

float fishspeed = 8;
float topfishspeed = 8;
int flip = 1; 
int topflip = -1; 

void setup () {
  size (800,800);
  frameRate (30);
  //set all to center mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  smooth();
}

void draw() {
  acquarium();
  grayfish();
  bubblesfish();
}




void acquarium() {
  //aquarium
  background (81,198,250);
}

void grayfish() {
  //gray fish top

  //top fin
  stroke(bluestroke1, bluestroke2, bluestroke3);
  fill(grey);
  strokeWeight(3);
  quad(topfishx-30*topflip,topfishy-26,topfishx+30*topflip,topfishy-26,topfishx+6*topflip,topfishy-46,topfishx-54*topflip,topfishy-46);
  strokeWeight (1);
  line (topfishx-15*topflip,topfishy-26,topfishx-34*topflip,topfishy-41);
  line (topfishx,topfishy-26,topfishx-19*topflip,topfishy-41);
  line (topfishx+15*topflip,topfishy-26,topfishx-4*topflip,topfishy-41);


  //tail
  stroke(bluestroke1, bluestroke2, bluestroke3);
  fill(grey);
  strokeWeight(3);
  triangle(topfishx-70*topflip,topfishy, topfishx-110*topflip,topfishy, topfishx-160*topflip,topfishy-50);
  triangle(topfishx-70*topflip,topfishy,topfishx-110*topflip,topfishy, topfishx-160*topflip,topfishy+50);


  //body
  stroke(bluestroke1, bluestroke2, bluestroke3);
  strokeWeight(5);
  fill(grey);
  ellipse(topfishx,topfishy,160,60);



  //eye
  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse (topfishx+60*topflip,topfishy-10,15,15);
  fill(0);
  ellipse (topfishx+56*topflip,topfishy-7,5,5);

  //mouth
  line(topfishx+79*topflip,topfishy+5,topfishx+72*topflip,topfishy+3);

  //gills
  stroke (bluestroke1, bluestroke2, bluestroke3);
  strokeWeight (1);
  line (topfishx+38*topflip,topfishy-7,topfishx+38*topflip,topfishy+10);
  line (topfishx+33*topflip,topfishy-5,topfishx+33*topflip,topfishy+8);
  line (topfishx+28*topflip,topfishy-4,topfishx+28*topflip,topfishy+7);

  //bubbles grey fish
  stroke(0);
  fill(255);

  ellipse (topfishx+79*topflip,topfishy-60,7,7);
  ellipse (topfishx+75*topflip,topfishy-40,7,7);
  ellipse (topfishx+79*topflip,topfishy-20,7,7);
  ellipse (topfishx+75*topflip,topfishy-100,7,7);
  ellipse (topfishx+79*topflip,topfishy-160,7,7);
  ellipse (topfishx+75*topflip,topfishy-260,7,7);
  ellipse (topfishx+79*topflip,topfishy-410,7,7);
  ellipse (topfishx+75*topflip,topfishy-600,7,7);

  topfishx = topfishx - topfishspeed; 

  if (topfishx > (width + 160) || topfishx < -160) {
    topfishspeed = topfishspeed * -1;
    topflip = topflip * -1;
  }
}

void anotherfish() {



  //gray fish

    //top fin
  stroke(bluestroke1, bluestroke2, bluestroke3);
  fill(grey);
  strokeWeight(3);
  quad(bottomfishx-30*flip,bottomfishy-26,bottomfishx+30*flip,bottomfishy-26,bottomfishx+6*flip,bottomfishy-46,bottomfishx-54*flip,bottomfishy-46);
  strokeWeight (1);
  line (bottomfishx-15*flip,bottomfishy-26,bottomfishx-34*flip,bottomfishy-41);
  line (bottomfishx,bottomfishy-26,bottomfishx-19*flip,bottomfishy-41);
  line (bottomfishx+15*flip,bottomfishy-26,bottomfishx-4*flip,bottomfishy-41);


  //tail
  stroke(bluestroke1, bluestroke2, bluestroke3);
  fill(grey);
  strokeWeight(3);
  triangle(bottomfishx-70*flip,bottomfishy, bottomfishx-110*flip,bottomfishy, bottomfishx-160*flip,bottomfishy-50);
  triangle(bottomfishx-70*flip,bottomfishy,bottomfishx-110*flip,bottomfishy, bottomfishx-160*flip,bottomfishy+50);


  //body
  stroke(bluestroke1, bluestroke2, bluestroke3);
  strokeWeight(5);
  fill(grey);
  ellipse(bottomfishx,bottomfishy,160,60);



  //eye
  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse (bottomfishx+60*flip,bottomfishy-10,15,15);
  fill(0);
  ellipse (bottomfishx+56*flip,bottomfishy-7,5,5);

  //mouth
  line(bottomfishx+79*flip,bottomfishy+5,bottomfishx+72*flip,bottomfishy+3);

  //gills
  stroke (bluestroke1, bluestroke2, bluestroke3);
  strokeWeight (1);
  line (bottomfishx+38*flip,bottomfishy-7,bottomfishx+38*flip,bottomfishy+10);
  line (bottomfishx+33*flip,bottomfishy-5,bottomfishx+33*flip,bottomfishy+8);
  line (bottomfishx+28*flip,bottomfishy-4,bottomfishx+28*flip,bottomfishy+7);

  //bubbles grey fish
  stroke(0);
  fill(255);

  ellipse (bottomfishx+79*flip,bottomfishy-60,7,7);
  ellipse (bottomfishx+75*flip,bottomfishy-40,7,7);
  ellipse (bottomfishx+79*flip,bottomfishy-20,7,7);
  ellipse (bottomfishx+75*flip,bottomfishy-100,7,7);
  ellipse (bottomfishx+79*flip,bottomfishy-160,7,7);
  ellipse (bottomfishx+75*flip,bottomfishy-260,7,7);
  ellipse (bottomfishx+79*flip,bottomfishy-410,7,7);
  ellipse (bottomfishx+75*flip,bottomfishy-600,7,7);

  bottomfishx = bottomfishx + fishspeed; 

  if (bottomfishx > (width + 160) || bottomfishx < -160) {
    fishspeed = fishspeed * -1;
    flip = flip * -1;
  }



  //red fish

  //top fin
  stroke(255,0,0);
  fill(245,136,47);
  strokeWeight(3);
  quad(mouseX-30,mouseY-26,mouseX+30,mouseY-26,pmouseX+6,pmouseY-46,pmouseX-54,pmouseY-46);
  strokeWeight (1);
  line (mouseX-15,mouseY-26,pmouseX-34,pmouseY-41);
  line (mouseX,mouseY-26,pmouseX-19,pmouseY-41);
  line (mouseX+15,mouseY-26,pmouseX-4,pmouseY-41);

  //tail
  stroke(255,0,0);
  fill(245,136,47);
  strokeWeight(3);
  triangle(mouseX-70,mouseY, mouseX-110,mouseY, pmouseX-160,pmouseY-50);
  triangle(mouseX-70,mouseY,mouseX-110,mouseY, pmouseX-160,pmouseY+50);

  //body
  stroke(255,0,0);
  strokeWeight(5);
  fill(250,133,23);
  ellipse(mouseX,mouseY,160,60);


  //eye
  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse (mouseX+60,mouseY-10,15,15);
  fill(0);
  ellipse (mouseX+56,mouseY-7,5,5);

  //mouth
  line(mouseX+79,mouseY+5,mouseX+72,mouseY+3);

  //gills
  stroke (255,0,0);
  strokeWeight (1);
  line (mouseX+38,mouseY-7,mouseX+38,mouseY+10);
  line (mouseX+33,mouseY-5,mouseX+33,mouseY+8);
  line (mouseX+28,mouseY-4,mouseX+28,mouseY+7);




  //bubbles red fish

  float bubblespeed = 0;
  float buoyancy = 0.1;

  stroke(0);
  fill(255);

  ellipse (pmouseX+79,pmouseY-60 + bubblespeed,7,7);
  ellipse (pmouseX+75,pmouseY-40 + bubblespeed,7,7);
  ellipse (pmouseX+79,pmouseY-20+ bubblespeed,7,7);
  ellipse (pmouseX+75,pmouseY-100+ bubblespeed,7,7);
  ellipse (pmouseX+79,pmouseY-160+ bubblespeed,7,7);
  ellipse (pmouseX+75,pmouseY-260+ bubblespeed,7,7);
  ellipse (pmouseX+79,pmouseY-410+ bubblespeed,7,7);
  ellipse (pmouseX+75,pmouseY-600+ bubblespeed,7,7);

  bubblespeed = bubblespeed + buoyancy;
  buoyancy = buoyancy - 0.01;
}






