class c_player
{
  float px;//player's x position
  float py;//player's y position
  float pSpd = 2.5;//player's speed (used for horizontal and vertical movements)
  
  final int BUFFSPACE = 40;//constant for the space around the starting place for the player
  
  //background color
  color ORANGE = #FFC012;
  
  //randomize player pos in the screen
  void randomizePlayer()
  {
    px = random(BUFFSPACE, width - BUFFSPACE);//randomize pos
    py = random(BUFFSPACE, height - BUFFSPACE);
  }
  
  //draw the player
  void drawPlayer()
  {
    fill(ORANGE);//orange
    ellipse(px, py, 11, 11);
  }
  
  //move player to follow the mouse
  void movePlayerFollowMouse()
  {
    //move horizontal
    if(mouseX > px)
    {
      px += pSpd;//move right
    }
    else if(mouseX < px)
    {
      px -= pSpd;//move left
    }
    
    //move vertical
    if(mouseY > py)
    {
      py += pSpd;//move down
    }
    else if(mouseY < py)
    {
      py -= pSpd;//move up
    }
  }
}