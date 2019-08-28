class World
{
  ArrayList<Plant> plants;
  ArrayList<Bee> bees;
  /**** CONSTRUCTOR ****/
  public World(int numOfTrees, int numOfBees){
    plants = new ArrayList<Plant>();
    bees = new ArrayList<Bee>();
    for(int i = 0; i<numOfTrees; i++ )
    {
      plants.add(new Plant((int)random(0,width),10,(int)(height*0.75)));
    }
    
    for(int i = 0; i<numOfBees; i++ )
    {
      addOneBee();
    }
  }
  /**** DRAW ****/
  public void draw()
  {
    for(int i = 0; i<plants.size(); i++ )
    {
      plants.get(i).draw();
    }
    for(int i = 0; i<bees.size(); i++ )
    {
      bees.get(i).draw();
    }
    
  }
  /**** BEHAVIOR ****/
  public void killOneBee()
  {
    bees.remove(bees.size()-1);
  }
  public void addOneBee()
  {
    bees.add(new Bee((int)random(0,width),(int)random(0,height)));
  }
}
