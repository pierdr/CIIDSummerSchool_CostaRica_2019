/*
The Population Growth Helper has the following methods:

· Constructors
  · PGH(float initialPopulation)
  · PGH(float initialPopulation, float growthFactor)
  · PGH(float initialPopulation, float growthFactor, int numberOfGenerations)
· Behavior/Functions/Methods
  · float getPopulation(int generation)
  · float getNormalizedValue(int generation)
  · void setInitialPopulation(float initialPopulation)
  · void setInitialPopulation(float initialPopulation)

*/

class PGH{
  /**** VARIABLES ****/
  public float g = 0.5;
  public float population[];
  public int   numGenerations;
    
  /**** CONSTRUCTOR ****/
  public PGH(float initialPopulation){
      this(initialPopulation, 0.5, 400);
  }
  public PGH(float initialPopulation, float growthFactor)
  {
     this(initialPopulation, growthFactor, 400);
  }
  public PGH(float initialPopulation, float growthFactor, int numberOfGenerations)
  {
    population = new float[numberOfGenerations];
    population[0]=initialPopulation;
    g = growthFactor;
    numGenerations = numberOfGenerations;
    generatePopulation();
  }
  /**** PRIVATE BEAHVIOR ****/
  private void generatePopulation(){
    for(int i = 1; i <numGenerations;i++)
    {
      population[i] = (population[i-1]*g)*(1-population[i-1]); 
    }
  }
  
  
  /**** PUBLIC BEHAVIOR · FUNCTIONS · METHODS ****/
  public float getPopulation(int generation)
  {
    if(generation>=numGenerations)
    {
      println("ERROR - generation is greater than num generation computed");
      return -1;
    }
    else
    {
      return map(population[generation],0,1,height,0);
    }
  }
  public float getNormalizedValue(int generation)
  {
    if(generation>=numGenerations)
    {
      println("ERROR - generation is greater than num generation computed");
      return -1;
    }
    else
    {
      return population[generation];
    }
  }
  public void setInitialPopulation(float initialPopulation)
  {
    population[0]=initialPopulation;
    generatePopulation();
  }
  public void setGrowthFactor(float growthFactor)
  {
    g = growthFactor;
    generatePopulation();
  }
}
