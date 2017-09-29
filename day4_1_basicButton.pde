import lx4p.*;

// LXPButton is lightweight button class
LXPButton red_button;
LXPButton green_button;
LXPButton blue_button;
color bg = 0;

void setup() {
  size(500,500);
  // button constructor x, y, w, h, title
  red_button = new LXPButton( 100,100, 100, 100, "Red");
  green_button = new LXPButton( 200,200, 100, 100, "Green");
  blue_button = new LXPButton( 300,300, 100, 100, "Blue");
}

void draw() {
  background(bg);
  red_button.draw(this);
  green_button.draw(this);
  blue_button.draw(this);
}

void mouseReleased() {
  // button.over is true if the cursor is inside the button
  if ( red_button.over ) {
    bg = color(255,0,0);
  }
  if ( green_button.over ) {
    bg = color(0,255,0);
  }
  if ( blue_button.over ) {
    bg = color(0,0,255);
  }
}