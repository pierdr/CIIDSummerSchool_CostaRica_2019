/*
The Termite Simulation Helper has the following methods:

· Constructors
  · TSH(int numTermX, int numTermY, int numWoodChips)
· Behavior/Functions/Methods 
  · void drawColony()
  · void drawPiles()
  · void drawChips()
*/


class TSH{
  /**** VARIABLES ****/
    ArrayList<termite> termiteContainer = new ArrayList();
    ArrayList<woodChip> woodChips  =  new ArrayList();
    ArrayList<woodChipPile> woodChipPiles  =  new ArrayList();
    
    private int numTermX = 20;
    private int numTermY = 20;
    
  /**** CONSTRUCTOR ****/
  public TSH(int numTermX, int numTermY, int numWoodChips){
    this.numTermX = numTermX;
    this.numTermY = numTermY;
    
    float unitX = width/numTermX;
    float unitY = height/numTermY;
      //ADD TERMITES
    for(int i = 0;i<numTermX;i++)
    {
       for(int j = 0;j<numTermY;j++)
       {
         termiteContainer.add(new termite(new PVector(unitX*i+(unitX*0.5),unitY*j+(unitY*0.5))));
       }
    }
     
     //ADD WOODCHIPS
      numWoodChips = int(sqrt(numWoodChips));
    for(int i = 0;i<numWoodChips;i++)
    {
       for(int j = 0;j<numWoodChips;j++)
       {
         woodChips.add(new woodChip());
       }
    }
  }
  /**** PUBLIC BEHAVIOR · FUNCTIONS · METHODS ****/
  void drawPiles()
  {
    for(int i = 0; i<woodChipPiles.size(); i++)
    {
      woodChipPiles.get(i).drawPile();
    }
  }
  void drawChips()
  {
    for(int i = 0; i<woodChips.size(); i++)
    {
      woodChips.get(i).drawChip();
    }
  }
  void drawColony()
  {
    for(int i = 0; i<termiteContainer.size(); i++)
    {
      termite t = termiteContainer.get(i);
      t.update();
      termiteContainer.get(i).applyForce(wind);
      t.checkEdgesContinuous();
      t.draw();
      if(t.cycles==0)
      {
        checkIfTermiteHitsPile(t);
        checkIfTermiteHitsWoodChip( t);
      }
    }
  }
  private void checkIfTermiteHitsWoodChip(termite t)
  {
    for(int i = 0; i<woodChips.size(); i++)
    {
      woodChip chipTmp = woodChips.get(i);
      if(t.location.dist(chipTmp.location)<6)
      {
        if(t.isCarryingWoodenChip)
        {
          woodChipPiles.add(new woodChipPile(chipTmp.location,2));
          woodChips.remove(i);
          t.dropOff(chipTmp.location,2);
        }
        else
        {
          
          woodChips.remove(i);
          t.pickUp(chipTmp.location,2);
        }
      }
    }
  }
  private void checkIfTermiteHitsPile(termite t)
  {
    for(int i = 0; i<woodChipPiles.size(); i++)
    {
      woodChipPile pileTmp = woodChipPiles.get(i);
      float dist = (pileTmp.numOfChips*5);
      if(t.location.dist(pileTmp.location)<dist)
      {
        if(t.isCarryingWoodenChip)
        {
          t.dropOff();
          pileTmp.addChip();
        }
        else
        {
          t.pickUp();
          pileTmp.removeChip();
        }
      }
    }
  }
}
