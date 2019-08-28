final static int INTRO = 0;
final static int GAME = 1;

int state = INTRO;

float gameEvent = 0;
float gameDuration = 5000;

void setup()
{

}
void draw()
{
  switch(state)
  {
    case INTRO:
     introDraw();
     introUpdate();
    break;
    case GAME:
     gameDraw();
     gameUpdate();
    break;
  }
  
}
void keyPressed()
{
  if(key == 's')
  {
    changeState(GAME);
  }
  
}
