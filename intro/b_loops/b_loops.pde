//LOOPS
int numOfRect = 50;

void setup()
{
  size(450,450);
}

void draw()
{
  background(0,0,0);
  stroke(0,0,0);
  
  for(int i=0; i<numOfRect; i++)
  {
    fill(0,0,255);
    
    rect(i*5,i*5,100,100);
  }
  
}

void keyPressed()
{
  
  
  if(keyCode == 37)
  {
    numOfRect = numOfRect -1;
  }
  else if(keyCode == 39)
  {
    numOfRect = numOfRect +1;
  }
}
