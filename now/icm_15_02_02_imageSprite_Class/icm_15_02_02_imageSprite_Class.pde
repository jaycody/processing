/* jstephens icm redux

from Learning Processing - Daniel Shiffman
http://www.learningprocessing.com

- exercise 15-2: image Sprite As Class

Rewrite Example 15-2 in an object-oriented fashion 
where the data for the image, location, size, rotation, and so on
is contained in a class. 
Can you have the class swap images when it hits the edge of the screen?
*/


NeekImage neekObj;

void setup() {
	size (640,480);
	neekObj = new NeekImage("neek.png", 64, 48, 50, 100, 0.8);
}


void draw() {
	
	neekObj.display();
	neekObj.move();
}

