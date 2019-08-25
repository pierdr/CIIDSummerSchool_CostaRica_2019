/*
  The Geo Growth Helper has the following methods:

· Constructors
  · GH(String fileName)
· Behavior/Functions/Methods
  

*/

import java.util.Map;


class PH{
   /**** VARIABLES ****/
  /** DATA **/
  private Table mapCities            = new Table();
  private final static int indexLat = 2;
  private final static int indexLon = 3;
  private final static int indexCountry = 5;
  private FloatDict  mapPollution    = new FloatDict();
  private Table workingTable;
  final static String pollutionData = "fossil-fuel-co2-emissions-by-nation.csv";
  final static String geoData = "cities.csv";
  
  /** OTHER **/
  public PGraphics g;
  
  
  /**** CONSTRUCTOR ****/
  public PH(){
    //FIRST LOAD POLLUTION DATA
    loadPollutionData();
    normalizePollutionData();
    println(mapPollution);
    
    //FIRST LOAD POLLUTION DATA
    loadGeoData();
    g = createGraphics(width,height,P2D);
    g.loadPixels();
    
    generateMap(color(0,102,153),color(255,102,0));
  }
  /**** PRIVATE BEHAVIOR ****/
  private void loadPollutionData()
  {
    workingTable = new Table();
    
    workingTable = loadTable(pollutionData);
    println(workingTable.getRowCount() + " total rows in pollution data");
    for(int i =1;i<workingTable.getRowCount();i++)
    {
      String state = workingTable.getString(i,1);
      float oldValue = 0;
      if(mapPollution.hasKey(state))
      {
        oldValue = mapPollution.get(state);
      }
      float newValue = oldValue + (float)(workingTable.getFloat(i,2));
      mapPollution.set(state, newValue);
    }
    
    
  }
  private void normalizePollutionData()
  {
    Iterable<Float> aTmp = mapPollution.values();
    float max = 0;
    for(Float i : aTmp)
    {
      if(i>max)
      {
        max = i;
      }
    }
    String[] keysTmp = mapPollution.keyArray();
    for(int i =0;i<keysTmp.length;i++)
    {
      mapPollution.set(keysTmp[i],(float)((float)mapPollution.get(keysTmp[i])/(float)max));
    }
    
    
  }
  private void loadGeoData()
  {
    mapCities = loadTable(geoData);
    println(mapCities.getRowCount() + " total rows in cities data");
  }
  
  private void generateMap(color lowEmissions, color highEmissions)
  {
    g.clear();
  
    
    for(int i =0;i<mapCities.getRowCount();i++)
    {
      float lat = mapCities.getFloat(i,PH.indexLat);
      float lon = mapCities.getFloat(i,PH.indexLon);
      
      int latN = constrain(int(map(lat,-90,90,height,0)),0,height-1);
      int lonN = constrain(int(map(lon,-180,180,0,width)),0,width-1);
      
      String country = mapCities.getString(i,indexCountry);
      
      if(mapPollution.hasKey(country))
      {
        float pollutionValue = mapPollution.get(country);
        g.pixels[(latN*width)+lonN]=lerpColor(lowEmissions,highEmissions,pollutionValue);
      }
    }
    //g.pixels[(256*width)+256]=color(0,255,0);
    g.updatePixels();
  }
  
  /**** PUBLIC BEHAVIOR · FUNCTIONS · METHODS ****/
  PGraphics getImage()
  {
    return g;
  }
  //void setColor(color newColor )
  //{
  //  generateMap(newColor);
  //}
}
