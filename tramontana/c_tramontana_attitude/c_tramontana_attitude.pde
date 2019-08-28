import websockets.*;
import tramontana.library.*;
Tramontana iphone;
float x,y,z;

void setup()
{
  size(600,400);
  iphone = new Tramontana(this,"192.168.22.190");
  iphone.subscribeAttitude(10);
}
void draw()
{
  background(0);
  fill(255,0,0);
  ellipse(map(x,-PI,PI,0,width),height/2,10,10);
  fill(0,255,0);
  ellipse(width/2,map(y,-PI,PI,0,height),10,10);
  fill(0,0,255);
  ellipse(map(z,-PI,PI,0,width),map(z,-PI,PI,height,0),10,10);
}
void onAttitudeEvent(String ip, float roll, float yaw, float pitch)
{
  x = roll;
  y = yaw;
  z = pitch;
}
