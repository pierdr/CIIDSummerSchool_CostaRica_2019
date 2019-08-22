class woodChipPile{
  int numOfChips = 0;
  PVector location;
  
  public woodChipPile()
  {
    location = new PVector(random(0,width),random(0,height));
  }
  
  public woodChipPile(int n)
  {
    numOfChips = n;
    location = new PVector(random(0,width),random(0,height));
  }
  public woodChipPile(PVector initV, int n)
  {
    location = initV;
    numOfChips = n;
  }
  public void drawPile()
  {
    noStroke();
    
    for(int i=0;i<numOfChips;i++)
    {
      fill(230,230,100,map(i,0,numOfChips,150,20));
      ellipse(location.x,location.y,i*5,i*5);
    }
  }
  
  
  public void addChip()
  {
    numOfChips++;
  }
  
  public void removeChip()
  {
    numOfChips--;
  }

}
