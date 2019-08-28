import websockets.*;
import tramontana.library.*;
Tramontana iphone;

void setup()
{
  iphone = new Tramontana(this,"192.168.22.190");
}
void draw()
{
  
}
void keyPressed()
{
  if(key == 'a')
  {
    iphone.makeVibrate();
  }
  else if(key == 's')
  {
    iphone.setColor(255,0,0,255);
  }
  else if(key == 'd')
  {
    iphone.showImage("https://i.pinimg.com/236x/81/bd/58/81bd583e32accb96c7d3dc88648f8d42.jpg");
  }
  else if(key == 'f')
  {
    iphone.pulseFlashLight(3, 0.5, 0.5);
  }
}
