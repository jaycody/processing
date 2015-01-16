/* jstephens icm redux

from Learning Processing - Daniel Shiffman
http://www.learningprocessing.com

- exercise 15-2: image Sprite

Declaring a variable of type PImage, 
    a class available to us from the Processing core library.
Use variables for position and rotation
*/


PImage neek;
float x;
float y;
float rot;

void setup(){
	size(640,480);
	neek = loadImage("neek.png");
	x = 100;
	y = 100;
	rot = .5;
}


void draw(){
	translate(x,y);
	rotate(rot);

	image(neek, 0,0,64,48);


	//adjust variables for animation

	rot+=.01;
	x+=2;
	//y+=1;

	if (x>width+neek.width) {
		x = -neek.width;
	}
}