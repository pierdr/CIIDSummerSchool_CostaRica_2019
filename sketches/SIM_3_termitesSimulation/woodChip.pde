class woodChip
{
  PVector location;
  PVector secondPoint;

  public woodChip()
  {
    location = new PVector(random(0,width),random(0,height));
    secondPoint = new PVector(location.x+random(-6,6),location.y+random(-6,6));
  }
  
  public void drawChip()
  {
    stroke(color(140,130,50));
    fill(color(140,140,50));
    strokeWeight(2);
    line(location.x,location.y,secondPoint.x,secondPoint.y);
  }
}
