class Bee
{
  int x;
  int y;
  public Bee(int initX, int initY)
  {
    x = initX;
    y = initY;
  }
  public void draw()
  {
    fill(255,255,0);
    rect(x,y,5,5);
  }
  
}
