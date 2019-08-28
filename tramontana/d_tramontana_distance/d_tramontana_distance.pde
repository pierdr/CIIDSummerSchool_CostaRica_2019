import websockets.*;
import tramontana.library.*;
Tramontana iphone;
int distanceVal=0;

void setup()
{
  size(600,400);
  iphone = new Tramontana(this,"192.168.22.190");
  iphone.subscribeDistance();
}
void draw()
{
  background(distanceVal*255);
}
void onDistanceEvent(String ip, int distanceValue)
{
  distanceVal = distanceValue;
}
