import websockets.*;
import tramontanaCV.*;

tramontanaCV iphone;
LBBoxContainer container;

void setup(){
  size(320,576);
  iphone = new tramontanaCV(this, "192.168.1.11"); 
}
void draw(){
  background(0);
  if(container!=null)
  {
    noFill();
    text(container.nBBoxes,100,100);
    for(int i=0;i<container.nBBoxes;i++)
    {
       rect(container.bboxes[i].x,container.bboxes[i].y,container.bboxes[i].w,container.bboxes[i].h);
    }
  }
}
void onBoundingBoxReceived(LBBoxContainer c, int nBlobs, String ip){
  container = c;
}
