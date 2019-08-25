Table co2data;
void setup()
{
  size(1024,512);
  co2data = new Table();
  co2data = loadTable("co2-coal-oil-gas.csv");
}

void draw()
{  background(0);
  for(int i =0;i<co2data.getRowCount();i++)
  {
    int xVal = (int)map(i,0,co2data.getRowCount(),0,width);
    
    float coal = co2data.getFloat(i,1);
    stroke(255,128,128,200);
    line(xVal,height-30,xVal,map(coal,0,1,height-30,30));
    
    float oil = co2data.getFloat(i,2);
    stroke(128,128,128,200);
    line(xVal,height-30,xVal,map(oil,0,1,height-30,30));
    
    float gas = co2data.getFloat(i,3);
    stroke(255,255,128,200);
    line(xVal,height-30,xVal,map(gas,0,1,height-30,30));
  }
  //LEGENDA
  stroke(0,0);
  fill(255,128,128,200);
  ellipse(30,30,5,5);
  text("coal",40,30);
  
  fill(128,128,128,200);
  ellipse(30,40,5,5);
  text("oil",40,40);
  
  fill(255,255,128,200);
  ellipse(30,50,5,5);
  text("gas",40,50);
}
