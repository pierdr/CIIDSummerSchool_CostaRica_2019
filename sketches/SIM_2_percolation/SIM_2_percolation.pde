
PH ph;

void setup()
{
  size(400,400,P2D);
  ph = new PH(0.60,800,800);
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
