import lx4p.*;
import processing.serial.*;
Serial myPort;  // Create object from Serial class

LXPButton mybutton;
color bg = 0;

void setup() {
  size(500,500);
  // button constructor x, y, w, h, title
  mybutton = new LXPButton( 100, 100, 100, 100, "Red");
  
  //search through list of serial ports for cu.usbserial...
  String portName = null;
  String[] ports = Serial.list();
  for(int i=0; i<ports.length; i++) {
    if ( ports[i].startsWith("/dev/cu.usb") ) {
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
  mybutton.draw(this);
}

void mouseReleased() {
  // button.over is true if the cursor is inside the button
  if ( mybutton.over ) {
    bg = color(255,0,0);
    myPort.write('r');
  }
}