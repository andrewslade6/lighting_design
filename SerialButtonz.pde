
import lx4p.*;
import processing.serial.*;
Serial myPort;  // Create object from Serial class

LXPButton one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, send;
LXPVScrollbar b_slider;
LXPColorPicker cp;

byte pixelnum = 0;
byte bright = 0;
color LED_color = 0;
color bg = 0;

void setup() {
  size(750,750);
  // button constructor x, y, w, h, title
  one        = new LXPButton( 50, 50, 50, 50, "one");
  two        = new LXPButton( 150, 50, 50, 50, "two");
  three      = new LXPButton( 250, 50, 50, 50, "three");
  four       = new LXPButton( 350, 50, 50, 50, "four");
  five       = new LXPButton( 450, 50, 50, 50, "five");
  six        = new LXPButton( 550, 50, 50, 50, "six");
  seven      = new LXPButton( 50, 150, 50, 50, "seven");
  eight      = new LXPButton( 150, 150, 50, 50, "eight");
  nine       = new LXPButton( 250, 150, 50, 50, "nine");
  ten        = new LXPButton( 350, 150, 50, 50, "ten");
  eleven     = new LXPButton( 450, 150, 50, 50, "eleven");
  twelve     = new LXPButton( 550, 150, 50, 50, "twelve");
  send       = new LXPButton( 500, 500, 100, 100, "SEND");
  
  b_slider  = new LXPVScrollbar( 650, 200, 30, 100, 10 );
  cp = new LXPColorPicker( 50, 250, 400, 400, 0);

  //search through list of serial ports for cu.usbserial...
  String portName = null;
  String[] ports = Serial.list();
  for(int i=0; i<ports.length; i++) {
    if ( ports[i].startsWith("COM3") ) {
      portName = ports[i];
      break;
    }
  }
  System.out.println(portName);
  if ( portName != null ) {
    myPort = new Serial(this, portName, 115200);
  } else {
    System.out.println("Port not found.  Bye.");
    System.exit(0);  //bail if port not found
  }
}

void draw() {
  background(bg);
  one.draw(this);
  two.draw(this);
  three.draw(this);
  four.draw(this);
  five.draw(this);
  six.draw(this);
  seven.draw(this);
  eight.draw(this);
  nine.draw(this);
  ten.draw(this);
  eleven.draw(this);
  twelve.draw(this);
  send.draw(this);
  
  b_slider.draw(this);
  cp.draw(this);
   
  b_slider.update(this);
  bright = (byte)b_slider.getValue();
  // pick returns true when mouse is down inside picker
  if ( cp.pick(this) ) {
    // the color under the mouse is obtained from the property current
    bg = cp.current;
    LED_color = cp.current;
  }
}

void senddata(){
  //send stuff
  myPort.write(pixelnum);
  myPort.write((byte) LED_color >> 16);
  myPort.write((byte) LED_color >> 8);
  myPort.write((byte) LED_color);
  myPort.write(bright);
}

void send(){

myPort.write('R');
myPort.write('G');
myPort.write('B');
myPort.write('R');
myPort.write('G');
myPort.write('B');
  
}


void mouseReleased() {
  // button.over is true if the cursor is inside the button

    if( one.over) send();
    else if( two.over)   myPort.write('G');
    else if( three.over) myPort.write('B');
    //else if( four.over)  pixelnum = 3;
    //else if( five.over)  pixelnum = 4;
    //else if( six.over)   pixelnum = 5;
    //else if( seven.over) pixelnum = 6;
    //else if( eight.over) pixelnum = 7;
    //else if( nine.over)  pixelnum = 8;
    //else if( ten.over)   pixelnum = 9;
    //else if(eleven.over) pixelnum = 10;
    //else if(twelve.over) pixelnum = 11;
    //else if(send.over) senddata();
}