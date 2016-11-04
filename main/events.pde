void mousePressed()
{
  if(mouseButton == RIGHT)
  {
    //stop the game
    isRunning = false;
    resetObjects = true;
  }
  else if(mouseButton == LEFT)
  {
    //game just started
    isRunning = true;
    fc = 0;
  }
}
