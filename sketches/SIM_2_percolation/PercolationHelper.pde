/*
The Percolation Helper has the following methods:

· Constructors
  · PH(float density,int sizeW,int sizeH)
  · PH(float density)
· Behavior/Functions/Methods
  · void draw()
  · void setOnFire()
  · void nextDay()
  
Percolation theory describes the behaviour of connected clusters like fluido dynamics, dental decay, forest fires... 

Percolation has a statistical nature, and the critical density is a key concept in percolation. 
Above the critical density, there is a spread accross most of the board.

More: 
https://en.wikipedia.org/wiki/Percolation
https://en.wikipedia.org/wiki/Percolation_theory

*/

class PH{
  /**** VARIABLES ****/
  float forestDensity = 0.66;
  PGraphics p;
  int numCol = 100;
  int numRow = 100;
  boolean isOnFire = false;
  
  /**** CONSTRUCTOR ****/
  public PH(float density,int sizeW,int sizeH)
  {
    numCol = sizeW;
    numRow = sizeH;
    forestDensity = density;
    p = createGraphics(numCol, numRow,P2D);
    p.loadPixels();
    //noiseDetail(38,map(density,0,1,0.3,0.7));
    for(int i=0;i<numRow;i++)//row
    {
      for(int j=0;j<numCol;j++)//columns
      {
        //float noiseTmp = noise(map(i,0,400,0,1),map(j,0,400,0,1));
        float noiseTmp = random(0,1);
        if(noiseTmp<density)
        {
          p.pixels[(i*numCol)+j] = color(0,255,0);
         
        }
        else
        {
          p.pixels[(i*numCol)+j] = color(0,0,0);
          
        }
      }
    }
    p.updatePixels();
    println("done creating forest");
    
  }
  public PH(float density){
    this(density,100,100);
  }
  /**** PUBLIC BEHAVIOR · FUNCTIONS · METHODS ****/
  public void draw()
  {
    image(p,0,0,width,height);
  }
  public void setOnFire()
  {
    //find first tree
    for(int i=0;i<numRow;i++)//row
    {
      for(int j=0;j<numCol;j++)//columns
      {
        //set on fire
        if( p.pixels[(i*numCol)+j] == color(0,255,0))
        {
          p.pixels[(i*numCol)+j] = color(255,0,0);
          p.updatePixels();
          isOnFire = true;
          return;
        }
      }
    }
    
   
    
  }
  public void nextDay()
  {
    for(int i=0;i<numRow;i++)//row
    {
      for(int j=0;j<numCol;j++)//columns
      {
        if( p.pixels[(i*numCol)+j] == color(255,0,0))
        {
        
           if( j<numCol-1)
           {
             if( p.pixels[(i*numCol)+(j+1)] == color(0,255,0))
             {
                p.pixels[(i*numCol)+(j+1)] = color(255,0,0);
             }
           }
           
           if(j>0)
           {
             if(  p.pixels[(i*numCol)+(j-1)] == color(0,255,0) )
             {
                 p.pixels[(i*numCol)+(j-1)] = color(255,0,0);
             }
           }
           if(i<numCol-1)
           {
             if( p.pixels[((i+1)*numCol)+(j)] == color(0,255,0))
             {
                p.pixels[((i+1)*numCol)+(j)] = color(255,0,0);
             }
           }

           if(i>0)
           {
             if(  p.pixels[((i-1)*numCol)+(j)]== color(0,255,0))
             {
                 p.pixels[((i-1)*numCol)+(j)] = color(255,0,0);
             }
           }

          
        }
      }
    }
    p.updatePixels();

  }
}
