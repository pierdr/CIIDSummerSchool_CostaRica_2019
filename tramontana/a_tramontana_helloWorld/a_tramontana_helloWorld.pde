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
  iphone.makeVibrate();
}
