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
   text(ph.getCurrentYear(),10,height-40);
}

void keyPressed()
{
  
  if(keyCode ==37){
    ph.previousYear();
  }
  else if(keyCode == 39)
  {
    println("here");
    ph.nextYear();
  }
}
