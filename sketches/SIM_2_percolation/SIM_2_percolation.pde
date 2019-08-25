
PH ph;

void setup()
{
  size(400,400,P2D);
  ph = new PH(0.59,400,400);
}

void draw()
{
  background(255);
  ph.draw();
  if(ph.isOnFire)
  {
    ph.nextDay();
  }
}

void keyPressed()
{
  if(key == 'f')
  {
    ph.setOnFire();
  }
}
