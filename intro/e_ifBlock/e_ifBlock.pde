
void setup()
{
  size(240,240);
  ellipseMode(CENTER);
 
}
void draw()
{
   background(255);
 
  if(dist(mouseX,mouseY,width/2,height/2)<50.0)
  {
    fill(255,128,0,100);
  }
  else 
  {
    fill(128,255,0,100);
  }
  ellipse(width/2,height/2,100,100);
  
}
