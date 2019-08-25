/*
  The Geo Growth Helper has the following methods:

· Constructors
  · GH(String fileName)
· Behavior/Functions/Methods
  

*/

import java.util.Map;
import java.util.Set;
import java.util.Iterator;

class PH{
   /**** VARIABLES ****/
  /** DATA **/
  private Table mapCities            = new Table();
  private final static int indexLat = 2;
  private final static int indexLon = 3;
  private final static int indexCountry = 5;
  //private FloatDict  mapPollution    = new FloatDict();
  private HashMap<Integer,FloatDict> mapPollution = new HashMap<Integer,FloatDict>();
  private Table workingTable;
  final static String pollutionData = "fossil-fuel-co2-emissions-by-nation.csv";
  final static String geoData = "cities.csv";
  
  /** OTHER **/
  public PGraphics g;
  int currentYear = 1751;
  
  /**** CONSTRUCTOR ****/
  public PH(){
    //FIRST LOAD POLLUTION DATA
    loadPollutionData();
    normalizePollutionData();
   
    
    //FIRST LOAD POLLUTION DATA
    loadGeoData();
    g = createGraphics(width,height,P2D);
    g.loadPixels();
    
    generateMap(currentYear,color(0,102,153),color(255,102,0));
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
      Integer year = workingTable.getInt(i,0);
      if(!mapPollution.containsKey(year))
      {
        mapPollution.put(year,new FloatDict());
      }
      mapPollution.get(year).set(state, workingTable.getFloat(i,2));
    }
  }
  private void normalizePollutionData()
  {
    Set keys = mapPollution.keySet();
     Iterator i = keys.iterator();
     while (i.hasNext()) {  
       normalizePollutionDataByYear((int) i.next());
     }
  }
  private void normalizePollutionDataByYear(int year)
  {
    println(year);
    FloatDict dictOfYear = mapPollution.get(year);
    Iterable<Float> valuesInYear = dictOfYear.values();
    float max = 0;
    for(Float elem : valuesInYear)
    {
      if(elem>max)
      {
        max = elem;
      }
    }
    String[] keysTmp = mapPollution.get(year).keyArray();
    for(int i =0;i<keysTmp.length;i++)
    {
      mapPollution.get(year).set(keysTmp[i],(float)((float)mapPollution.get(year).get(keysTmp[i])/(float)max));
    }
    
  }
  private void loadGeoData()
  {
    mapCities = loadTable(geoData);
    println(mapCities.getRowCount() + " total rows in cities data");
  }
  
  private void generateMap(int year, color lowEmissions, color highEmissions)
  {
    g.clear();
  
    
    for(int i =0;i<mapCities.getRowCount();i++)
    {
      float lat = mapCities.getFloat(i,PH.indexLat);
      float lon = mapCities.getFloat(i,PH.indexLon);
      
      int latN = constrain(int(map(lat,-90,90,height,0)),0,height-1);
      int lonN = constrain(int(map(lon,-180,180,0,width)),0,width-1);
      
      String country = mapCities.getString(i,indexCountry);
      
      if(mapPollution.get(year).hasKey(country))
      {
        float pollutionValue = mapPollution.get(year).get(country);
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
  public  void changeYear(int newYear )
  {
    generateMap(newYear,color(0,102,153),color(255,102,0));
  }
  public void nextYear()
  {
    currentYear +=(currentYear>=2011)?0:1;
    changeYear(currentYear);
  }
  public void previousYear()
  {
    currentYear -=(currentYear<=1751)?0:1;
    changeYear(currentYear);
  }
  public int getCurrentYear()
  {
    return currentYear;
  }
}
