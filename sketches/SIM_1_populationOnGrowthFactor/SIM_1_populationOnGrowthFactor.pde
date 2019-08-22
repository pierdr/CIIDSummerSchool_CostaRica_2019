/*
  This algorithm is based on 1976 Robert May's Logistic map equation. 
  You can find more info here: 
  https://en.wikipedia.org/wiki/Logistic_map
  
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
  
  
  drawPopulationOnGrowthFactorWithLines();
}

void mouseMoved()
{
  pgh.setInitialPopulation(map(mouseY,0,height,0,1));
}

void drawPopulationOnGrowthFactorWithLines()
{
  PVector prevPoint = new PVector(0,0);
  for(float g=0.0;g<4.0;g+=0.005)
  {
    pgh.setGrowthFactor(g);
    PVector currentPoint = new PVector(map(g,0,4.0,0,width),pgh.getPopulation(99));
    line(prevPoint.x,prevPoint.y,currentPoint.x,currentPoint.y);
    prevPoint = currentPoint;
    
  }
}

void drawPopulationOnGrowthFactorWithPoints()
{
  for(float g=0.0;g<4.0;g+=0.005)
  {
    pgh.setGrowthFactor(g);
    point(map(g,0,4.0,0,width),pgh.getPopulation(99));
  }
}
