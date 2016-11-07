void mousePressed()
{
  if(mouseButton == RIGHT)
  {
    //stop the game
    isRunning = false;
    resetObjects = true;
    fc = 0;
  }
  else if(mouseButton == LEFT)
  { 
    if(isLost)
    {
      resetObjects = true;
    }
    //game just started
    isRunning = true;
  }
}