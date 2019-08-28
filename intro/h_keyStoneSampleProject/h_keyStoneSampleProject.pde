import deadpixel.keystone.*;
Keystone ks;

CornerPinSurface surface;


PGraphics offscreen;


void setup() {

  //size(800, 600, P3D);
  fullScreen(P3D);
  ks = new Keystone(this);
  surface  = ks.createCornerPinSurface(400, 300, 5);
 
  offscreen  = createGraphics(400, 300, P3D);

}
void draw() {
  background(0);
  offscreen.beginDraw();
    offscreen.background(255,0,255);
    offscreen.rect(10,10,40,50);
    offscreen.ellipse(20,20,500,500);
  offscreen.endDraw();
  surface.render(offscreen);
}

void keyPressed() {
  switch(key) {
  case 'c':
    // enter/leave calibration mode, where surfaces can be warped 
    // and moved
    ks.toggleCalibration();
    cursor();
    break;

  case 'l':
    // loads the saved layout
    ks.load();
    break;

  case 's':
    // saves the layout
    ks.save();
    break;
  }
}
