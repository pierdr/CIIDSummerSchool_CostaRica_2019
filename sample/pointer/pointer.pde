import tramontana.library.*;
import websockets.*;

Tramontana phone;

float roll; //rotating phone sideways (not used in this example)
float pitch; //orienting phone up and down (vertical orientation varies from -1 to 1, where 1 = up, 0 = horizontal, -1 = down)
float yaw; //orienting phone left and right (horizontal orientation varies from -3 to 3)

float pitchStart; //pitch value at moment of calibration
float yawStart; //yaw value at moment of calibration

float xPos = 0;
float yPos = 0;

boolean touch = false;
boolean calibrate = true;

void setup(){
 fullScreen();
 
 //set the nr to the IP address of your device
 phone = new Tramontana(this,"192.168.22.181");
 
 phone.subscribeAttitude(15);
 phone.subscribeTouch();
}

void draw(){
  background(0);
  
  if(calibrate && touch)
  {
    //point phone at center of your screen and touch it to calibrate
    calibrate();
  }
  else if(!calibrate)
  {       
    xPos = map(yaw, yawStart-0.6, yawStart+0.6, width, 0);
    yPos = map(pitch, pitchStart-0.4, pitchStart+0.4, height, 0);
    
    //draw pointer on screen
    fill(255, 255, 255);
    noStroke();
    ellipse(xPos, yPos, 10, 10);
  } 
}

void onTouchEvent(String ipAddress, int x, int y) {
  touch = true;
  phone.setColor(0, 0, 255, 255);  
}

void onAttitudeEvent(String ipAddress, float newRoll, float newPitch, float newYaw)
{
  roll  =  newRoll;
  pitch =  newPitch;
  yaw   =  newYaw;
}

void calibrate()
{
  pitchStart = pitch;
  yawStart = yaw;
    
  touch = false;
  calibrate = false;
}
