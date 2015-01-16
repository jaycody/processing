/* jstephens icm redux

from Learning Processing - Daniel Shiffman
http://www.learningprocessing.com

- Example 15-1: "Hello World" images

Declaring a variable of type PImage, 
    a class available to us from the Processing core library.
*/

PImage icm;
PImage neek;


void setup() {
	size(640,480);
	icm = loadImage("icm.png");
	neek = loadImage("neek.png");
}


void draw() {
	image(icm,0,0);
	image(neek, mouseX, mouseY);

}