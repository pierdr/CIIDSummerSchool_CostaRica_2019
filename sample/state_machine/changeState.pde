void changeState(int newState){
  if(state==newState)
  {
    return;
  }
  switch(newState){
    
    case INTRO:
      
    break;
    case GAME:
      gameEvent = millis();
    break;
  }
  state = newState;
}
