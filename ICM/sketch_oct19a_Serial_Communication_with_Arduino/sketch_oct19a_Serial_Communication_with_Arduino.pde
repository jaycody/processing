//jason stephens
//PCOMP - sensor graphing

//This sketch takes raw bytes from the serial port at 9600 baud and graphs them.

import processing.serial.*;

Serial myPort;        // The serial port
int graphXPos = 1;    // the horizontal position of the graph:  

void setup () {
  size(800, 300);        // window size

  // List all the available serial ports
  println(Serial.list());
  // I know that the fisrt port in the serial list on my mac
  // is usually my Arduino module, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[0], 9600);

  // set inital background:
  background(48,31,65);
}
void draw () {
  // nothing happens in draw.  It all happens in SerialEvent()
}

void serialEvent (Serial myPort) {
  // get the byte:
  int inByte = myPort.read(); 
    // print it:
  println(inByte);
  // set the drawing color. Pick a pretty color:
  stroke(123,128,158);
  // draw the line:
  line(graphXPos, height, graphXPos, height - inByte);

  // at the edge of the screen, go back to the beginning:
  if (graphXPos >= width) {
    graphXPos = 0;
    // clear the screen:
    background(48,31,65); 
  } 
  else {
    // increment the horizontal position for the next reading:
    graphXPos++;
  }
}

