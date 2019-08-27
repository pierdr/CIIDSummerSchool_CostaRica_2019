PImage img;
PImage img2;
void setup()
{
  size(450,450);
  img = loadImage("tucan.jpg");
  img2 = loadImage("viper.jpg");
}

void draw()
{
  background(0,0,0);
  
  for(int i=0;i<10;i++)
  {
    tint(255,i*25);
    image(img,i*10,i*10,i*25,i*25);
  }
  tint(255,255);
  image(img2,mouseX,mouseY,256,256);
}
