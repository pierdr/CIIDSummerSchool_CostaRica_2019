
PVector wind = new PVector(0,0); 


TSH tsh;

void setup()
{
 size(720,480);
 
  tsh = new TSH(20,20,800);
}

void draw()
{
  background(0);
  
  tsh.drawChips();
  tsh.drawColony(); 
  tsh.drawPiles();  
}

void mouseMoved()
{
  //wind = new PVector(map(mouseX,0,width,-0.005,0.005),map(mouseY,0,height,-0.005,0.005));
}
