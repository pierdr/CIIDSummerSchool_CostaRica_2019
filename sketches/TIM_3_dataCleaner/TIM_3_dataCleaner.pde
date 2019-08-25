Table input;
Table output;
FloatDict coalDict;
FloatDict oilDict;
FloatDict gasDict;
void setup()
{
  //LOAD DATA
  input = new Table();
  input = loadTable("fossil-fuel-co2-emissions-by-nation.csv");
  
  //PREPARE OUTPUT
  output = new Table();
  output.addColumn("year");
  output.addColumn("coal");
  output.addColumn("oil");
  output.addColumn("gas");
  
  //PREPARE WORKING DICT
  coalDict = new FloatDict();
  oilDict = new FloatDict();
  gasDict = new FloatDict();
  
  for(int i = 1; i< input.getRowCount();i++)
  {
    String year = input.getString(i,0);
    float oldVal = 0;
    //COAL
    if(coalDict.hasKey(year))
    {
      oldVal = coalDict.get(year);
    }
    coalDict.set(year,oldVal+input.getFloat(i,3));
    
    //OIL
    oldVal = 0;
    if(oilDict.hasKey(year))
    {
      oldVal = oilDict.get(year);
    }
    oilDict.set(year,oldVal+input.getFloat(i,4));
    
    //GAS
    oldVal = 0;
     if(gasDict.hasKey(year))
    {
      oldVal = gasDict.get(year);
    }
    gasDict.set(year,oldVal+input.getFloat(i,5));
  }
  
  //FIND MAX
  float max=0;
  String[] years = coalDict.keyArray();
  for(int i=0;i<years.length;i++)
  {
    
    if(coalDict.get(years[i])>max)
    {
      max = coalDict.get(years[i]);
    }
    if(oilDict.get(years[i])>max)
    {
      max = oilDict.get(years[i]);
    }
    if(gasDict.get(years[i])>max)
    {
      max = gasDict.get(years[i]);
    }
  }
 
  //NORMALIZE
  for(int i=0;i<years.length;i++)
  {
    coalDict.set(years[i], coalDict.get(years[i])/max);
    oilDict.set(years[i], oilDict.get(years[i])/max);
    gasDict.set(years[i], gasDict.get(years[i])/max);
  }
  //SAVE OUTPUT
  for(int i=0;i<years.length;i++)
  {
    output.addRow();
    output.setString(i,"year",years[i]);
    output.setFloat(i,"coal",coalDict.get(years[i]));
    output.setFloat(i,"oil",oilDict.get(years[i]));
    output.setFloat(i,"gas",gasDict.get(years[i]));
  }
  saveTable(output, "data/output.csv");
  
  exit();
}
void draw()
{
  
}
