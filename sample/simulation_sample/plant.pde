class Plant
{
  int x            = 0;
  int soilHeight   = 0;
  int plantHeight  = 0;
  
 
  public Plant(int initX,int initSoilH, int initPlantH)
  {
    x           = initX;
    soilHeight  = initSoilH;
    plantHeight = initPlantH;
  }
  public void draw()
  {
    fill(0,255,0);
    rect(x,height-soilHeight-plantHeight,5,plantHeight);
  }
}
