PH ph;

void setup()
{
  size(1024,512,P2D);
  ph = new PH();
}

void draw()
{
   background(0);
   image(ph.getImage(),0,0);
   text("1751-2011",10,height-30);
}
