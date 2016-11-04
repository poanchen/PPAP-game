void mousePressed()
{
  //clear the bg color to be light blue as the game just started or ended
  
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