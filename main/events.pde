void mousePressed()
{
  //clear the bg color to be light blue as the game just started or ended
  background(LIGHTBLUE);
  
  if(mouseButton == RIGHT)
  {
    //toggle game running or not
    player.randomizePlayer();
  }
  else if(mouseButton == LEFT)
  {
    //game just started
    isRunning = true;
    fc = 0;
    drawRandRect();
    drawRandTri();
    drawRandElli();
  }
}