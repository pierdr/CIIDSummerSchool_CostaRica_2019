void gameSetup(){
  //something
}
void gameDraw()
{
  background(0,255,0); 
  fill(0);
  text((int)(millis()-gameEvent)/1000,10,10);
}
void gameUpdate()
{
  if(millis()-gameEvent>gameDuration){
    changeState(INTRO);
  }
}
