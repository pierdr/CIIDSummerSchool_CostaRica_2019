Table co2XdayData;
int totalNumRows = 0;

void setup()
{
  size(1024,512,P2D);
  co2XdayData = new Table();
  co2XdayData = loadTable("co2-ppm-daily_csv.csv");
  totalNumRows = co2XdayData.getRowCount();

}

void draw()
{
   background(0);
    
    stroke(255);
    for(int i=0;i<totalNumRows;i++)
    {
      int iX = (int) map(i,0,totalNumRows,0,width);
      line(iX,height-30,iX,map(co2XdayData.getFloat(i,1),280,450,height-30,0));
    }
    //LEGENDA
    stroke(128,128);
    fill(255,150);
    int forhundredsLine = (int)map(400,280,450,height-30,0);
    line(0,forhundredsLine,width,forhundredsLine);
    text("400ppm",10,forhundredsLine);
    int threehundredsLine = (int)map(350,280,450,height-30,0);
    line(0,threehundredsLine,width,threehundredsLine);
    text("350ppm",10,threehundredsLine);
    stroke(255);
    fill(255,255);
    text("1958",10,height-10);
    text("2019",width-40,height-10);
}
