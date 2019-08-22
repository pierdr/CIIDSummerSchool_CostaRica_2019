/*
  This way of visualizing the logistic map (https://en.wikipedia.org/wiki/Logistic_map) is called bifucation diagram.
  You can find more info here: 
  https://en.wikipedia.org/wiki/Bifurcation_diagram
  
*/


PGH pgh;

void setup()
{
  size(800,400);
  pgh = new PGH(0.5,1.1,100);
  
}
void draw()
{
  background(255);
  fill(0);
  text(pgh.g,20,20);
  scale(8.0,1.0);

  drawPopulationWithLines();
  
  
}
void mouseMoved()
{
  pgh.setInitialPopulation(map(mouseY,height,0,0,1));
  pgh.setGrowthFactor(map(mouseX,0,width,0,4));
}
void drawPopulationWithLines()
{
  for(int i = 1;i<100;i++)
  {
    line(i-1,pgh.getPopulation(i-1),i,pgh.getPopulation(i));
  }
}
void drawPopulationWithPoints()
{
  for(int i = 0;i<100;i++)
  {
    point(i,pgh.getPopulation(i));
  }
}
