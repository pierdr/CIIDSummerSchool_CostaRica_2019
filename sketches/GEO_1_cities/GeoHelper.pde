/*
  The Geo Growth Helper has the following methods:

· Constructors
  · GH(String fileName)
· Behavior/Functions/Methods
  

*/


class GH{
   /**** VARIABLES ****/
  private Table table;
  public PGraphics g;
  int indexLat = 0;
  int indexLon = 0;
  
  /**** CONSTRUCTOR ****/
  public GH(String fileName){
    this(fileName,0,1);
  }
  public GH(String fileName,int indexLat, int indexLon){
    table = loadTable(fileName);

    println(table.getRowCount() + " total rows in table");
    this.indexLat = indexLat;
    this.indexLon = indexLon;
    generateMap(color(0,255,120,160));
  }
  /**** PRIVATE BEHAVIOR ****/
  private void generateMap(color foregroundColor)
  {
    g = createGraphics(width,height,P2D);
    g.loadPixels();
  
    for (int row=0;row<table.getRowCount();row++) {
  
      float lat = table.getFloat(row,indexLat);
      float lon = table.getFloat(row,indexLon);
      
      int latN = constrain(int(map(lat,-90,90,height,0)),0,height-1);
      int lonN = constrain(int(map(lon,-180,180,0,width)),0,width-1);
      
      g.pixels[(latN*width)+lonN]=foregroundColor;
    }
    //g.pixels[(256*width)+256]=color(0,255,0);
    g.updatePixels();
  }
  
  /**** PUBLIC BEHAVIOR · FUNCTIONS · METHODS ****/
  PGraphics getImage()
  {
    return g;
  }
  void setColor(color newColor )
  {
    generateMap(color(0,255,120,160));
  }
  
  
}