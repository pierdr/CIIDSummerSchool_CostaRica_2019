GH ghAirports;
GH ghCities;

int index = 0;

void setup() {
  size(1024, 512, P2D);
  ghAirports = new GH("airports.csv", 6, 7);
  ghCities = new GH("cities.csv",2,3);
  
  ghCities.setColor(color(255,128,0,150));
  ghAirports.setColor(color(128,255,0,150));
}

void draw() {
  background(0);
  if(index==0 || index>=2 )
  {
    image(ghAirports.getImage(), 0, 0, width, height);
    text("airports",10,height-30);
  }
  if(index>=1)
  {
    image(ghCities.getImage(), 0, 0, width, height);
    text("cities",60,height-30);
  }
}
void keyPressed()
{
  if(keyCode == 39 )//RIGHT
  {
    index++;
    index = index%3;
  }
  if(keyCode == 37)//LEFT
  {
    index--;
    if(index<0)
    {
      index=2;
    };    
  }
}
