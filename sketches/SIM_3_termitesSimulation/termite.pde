
/*
TERMITE BEHAVIOR: 
“If you are not carrying anything and you bump into a wood chip, pick it up. 
If you are carrying a wood chip and you bump into another wood chip, 
put it down the wood chip you're carrying.”

Excerpt From: [Mitchel Resnick] Turtles, termites and traffic jams 
*/

final static float deltaInitPos = 30; 
final static int numTail = 50; 

class termite{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed = 50;
  float mass = 1;
  boolean isCarryingWoodenChip = false;
  
  int cycles = 20;
  
  PVector positions[]=new PVector[numTail];
  
  
  public termite(PVector initPos)
  {
    location = new PVector(initPos.x+random(-deltaInitPos,deltaInitPos),initPos.y+random(-deltaInitPos,deltaInitPos));
    velocity = new PVector(random(0,topSpeed/50),random(0,topSpeed/50));
    
    acceleration = new PVector(0,0);
    for(int i = 0;i<numTail;i++)
    {
      positions[i] = new PVector();
    }
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  public void changeTopSpeed(float newTopSpeed)
  {
     topSpeed = newTopSpeed;
     velocity = new PVector(random(0,topSpeed/50),random(0,topSpeed/50));
  }
  public void update()
  {
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    
    acceleration.mult(0);
    cycles-=(cycles>0)?1:0;
  
    for(int i=29;i>0;i--)
    {
      positions[i]=positions[i-1].copy();
    }
    positions[0]=location.copy();
}
  public void draw(color c1, color c2)
  {
     noStroke();
    if(isCarryingWoodenChip)
    {
      line(location.x,location.y,location.x,location.y);
    }
    color c = (isCarryingWoodenChip)?c1:c2;
    fill(c);
    ellipse(location.x,location.y,mass*3,mass*3);
    
    for(int i=0;i<positions.length;i++)
    {
       fill(color(red(c),green(c),blue(c),map(i,0,numTail,100,10)));
       ellipse(positions[i].x,positions[i].y,1,1);
    }
  }
  public void draw()
  {
    
   this.draw(color(255,255,30),color(120,200,120));
  }
  void checkEdges()
  {
    if(location.x > width)
    {
      location.x = width;
      velocity.x *= -1;
    }
    else if(location.x <0)
    {
      velocity.x = -1;
      location.x =0;
    }
    
    if(location.y>height)
    {
      velocity.y *= -1;
      location.y = height;
    }
    else if(location.y<0)
    {
      velocity.y *= -1;
      location.y = 0;
    }
    
  }
  void checkEdgesContinuous()
  {
    if(location.x > width)
    {
      location.x = 0;
      
    }
    else if(location.x <0)
    {
      
      location.x =width;
    }
    
    if(location.y>height)
    {
      
      location.y = 0;
    }
    else if(location.y<0)
    {
      
      location.y = height;
    }
    
  }
  
  public void pickUp(PVector wcp,float dist)
  {
    isCarryingWoodenChip = true;
    velocity.x *= -1;
    velocity.y *=-1;
    while(location.dist(wcp)<dist)
    {
      location.add(velocity);
    }
  }
  public void dropOff(PVector wcp,float dist)
  {
    isCarryingWoodenChip = false;
    velocity.x *= -1;
    velocity.y *= -1;
    while(location.dist(wcp)<dist)
    {
      location.add(velocity); 
    }
  }
  public void pickUp()
  {
    isCarryingWoodenChip = true;
    velocity.x *= -1;
    velocity.y *=-1;
    cycles=1020;
    
  }
  public void dropOff()
  {
    isCarryingWoodenChip = false;
    velocity.x *= -1;
    velocity.y *= -1;
    cycles=1020;
   
  }
}
