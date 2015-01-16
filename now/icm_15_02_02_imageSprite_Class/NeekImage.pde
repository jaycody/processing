

class NeekImage {

	PImage 	neek;
	float x;
	float y;
	float w;
	float h;
	float rot;

	NeekImage(String filename, float _x , float _y, float _w, float _h, float _rot) {
		
		//load image an initialize variables
		neek = loadImage(filename);
		x = _x;
		y = _y;
		w = _w;
		h = _h;
		rot = _rot;
	}


	void display(){
		translate(mouseX, mouseY);
		rotate(rot);
		image(neek, 0, 0, w, h);
	}

	void move(){
		//x+=1;
		//y+=1;
		rot+=1.1;

	}
	


}