import websockets.*;
import tramontanaCV.*;

tramontanaCV iphone;
int numBlobs = 0;

void setup(){
  size(320,576);
  iphone = new tramontanaCV(this, "192.168.1.11"); 
}
void draw(){
  background(numBlobs*255);
}
void onBoundingBoxReceived(LBBoxContainer c, int nBlobs, String ip){
  numBlobs = nBlobs;
}
