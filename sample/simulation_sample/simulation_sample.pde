World w;

void setup()
{
  size(512,256);
  w = new World(10,100);
}
void draw()
{
  background(255,255,255);
  w.draw();
}


void keyPressed()
{
  if(key=='a')
  {
    w.killOneBee();
  }
  if(key == 's')
  {
    w.addOneBee();
  }
}
