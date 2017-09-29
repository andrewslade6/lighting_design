import lx4p.*;
import processing.serial.*;
Serial myPort;

// LXPVScrollbar is lightweight vertical scroll bar type control
LXPVScrollbar myslider;
color bg = 0;
color bg_old = 0;

void setup() {
  size(500,500);
  setupSerialPort();
  // scrollbar constructor x, y, w, h, tracking
  myslider = new LXPVScrollbar( 100, 200, 30, 100, 10 );
}

void draw() {
  background(bg);
  myslider.draw(this);
  myslider.update(this);
  bg_old = bg;
  bg = myslider.getValue();
  if(bg != bg_old) {
    myPort.write(bg);
    System.out.println(bg);
  }
}

void setupSerialPort() {
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