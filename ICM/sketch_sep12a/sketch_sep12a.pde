// Jason Stephens
// ITP-ICM Fall 2010
// Project #1 - In the Beginning Was the Beginning

size(1028,764);
background(0);
smooth();

//Circular Logic at the Vertices
strokeWeight(8);
fill(0,200,0);
ellipseMode(CORNER);
ellipse(580,300,50,50);
ellipse(412,200,75,75);
ellipse(380,300,100,100);
ellipse(480,400,120,120);
ellipse(580,175,150,150);

//repositioning large circle
ellipseMode(CENTER);
stroke(255);
strokeWeight(2);
fill(255,0,0);
strokeJoin(ROUND);
ellipse(580,175,150,150); //large red circle top right underneath
ellipse(580,300,50,50);
ellipse(412,200,75,75);
ellipse(380,300,100,100);
ellipse(480,400,120,120);

//Connecting The Points around the star
stroke(0,255,0);
strokeWeight(3);
line(50,250,512,50); //Top Left Line
line(50,250,225,600); //Bottom Left Line
line(225,600,990,730); //bottom line
line(990,730,950,150); //right line
line(950,150,512,50);  //top right line


//The 5 pointed star: or how I learned to join 5 triangles
stroke(255);
strokeWeight(8);
fill(0,0,255,100);
point(512,50);
point(412,200);
point(580,175);
triangle(512,50,412,200,580,175);  //top tri
triangle(412,200,380,300,50,250); //left tri
triangle(380,300,480,400,225,600);  //bottom left tri
triangle(480,400,990,730,580,300);  //bottom right
triangle(580,300,580,175,950,150);  //top right

//repositioning large circle
ellipseMode(CENTER);
stroke(255);
fill(255,0,0);
strokeJoin(ROUND);
noFill();
ellipse(580,175,150,150); //large red circle top right underneath
ellipse(580,300,50,50);
ellipse(412,200,75,75);
ellipse(380,300,100,100);
ellipse(480,400,120,120);

//Circular Logic at the Vertices
//strokeWeight(8);
//stroke(255);
//fill(255,0,0);
//ellipseMode(CENTER);
//ellipse(580,300,50,50);
//ellipse(412,200,75,75);
//ellipse(380,300,100,100);
//ellipse(480,400,120,120);

//Points for the inner vertices
stroke(255,255,0);
strokeWeight(4);
point(412,200);//top left
point(580,175);//top right
point(380,300);//bottom left
point(480,400);//bottom
point(580,300);//bottom right
line(412,200,580,300);//line from top left to bottom right
line(580,300,380,300);//line from bottom right to btm left
line(380,300,580,175);//line btm left to top right
line(580,175,480,400);//line top right to bottom
line(480,400,412,200);//bottom to top left

//Circular Logic at the Vertices  aka circles underneath off center
strokeWeight(4);
stroke(0);
fill(0,200,0);
ellipse(580,300,20,20);
ellipse(412,200,25,25);
ellipse(380,300,30,30);
ellipse(480,400,40,40);
ellipse(580,175,50,50);

//line between vertices inside small pentagon
stroke(0,255,0);
line(50,750,112,500);
line(112,500,175,750);
line(175,750,5,600);
line(5,600,225,600);
line(225,600,50,750);



//We don't need no stinking ARCHES
fill(255,0,0,100);
stroke(255);
beginShape();//start the pentagon
vertex(225,600);//right top
vertex(175,750);//right bottom
vertex(50,750);//left bottom
vertex(5,600);//left top
vertex(112,500);//top
endShape(CLOSE);

//Comments
println("l33t seekeres of sweetness.....TK-421, why aren't you at your post?");













