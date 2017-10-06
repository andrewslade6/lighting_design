import lx4p.*;

LXPColorPicker cp;
LXPVScrollbar myslider;
LXPButton[] buttons = new LXPButton[12];
color bg = 0;
color color_picker = 0;
color color_picker_prev = 0;
color slider = 0;
color slider_prev = 0;

void setup() {
  size(1500,1000);
  cp = new LXPColorPicker( 10,600, 400,400, 0);
  myslider = new LXPVScrollbar( 500, 500, 30, 100, 10 );
  
  // create 12 buttons
  for(int i = 0; i < 12; i++){
    buttons[i] = new LXPButton(100*i, 100, 20, 20, Integer.toString(i));
  }
  
  background(0);
  
}

void draw() {
  for(int i = 0; i < 12; i++){
    buttons[i].draw(this);
  }
  if (color_picker_prev != color_picker)
    background(color_picker);
  myslider.draw(this);
  myslider.update(this);
  slider_prev = slider;
  slider = myslider.getValue();
  cp.draw(this);
  color_picker_prev = color_picker;
  if ( cp.pick(this) ) {
    color_picker = cp.current;
  }
}