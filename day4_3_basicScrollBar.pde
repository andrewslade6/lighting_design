import lx4p.*;

// LXPVScrollbar is lightweight vertical scroll bar type control
LXPVScrollbar myslider;
color bg = 0;
color bg_old = bg;

void setup() {
  size(500,500);
  // scrollbar constructor x, y, w, h, tracking
  myslider = new LXPVScrollbar( 100, 200, 30, 100, 10 );
}

void draw() {
  background(bg);
  myslider.draw(this);
  myslider.update(this);
  bg_old = bg;
  bg = myslider.getValue();
  if(bg != bg_old)
    System.out.println(bg);

}