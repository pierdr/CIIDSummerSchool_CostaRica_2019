PImage img;
PImage img2;
void setup()
{
  size(450,450);
  img = loadImage("cph.jpg");
  img2 = loadImage("cph2.jpg");
}

void draw()
{
  background(0,0,0);
  
  for(int i=0;i<10;i++)
  {
    tint(255,i*25);
    image(img,i*10,i*10,i*25,i*25);
  }
  tint(255,2`55);
  image(img2,mouseX,mouseY);
}
