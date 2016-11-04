class c_player
{
  int pSz = 30;//player size
  float px;//player's x position
  float py;//player's y position
  float pSpd = 2.5;//player's speed (used for horizontal and vertical movements)
  
  final int BUFFSPACE = 40;//constant for the space around the starting place for the player
  
  //background color
  color ORANGE = #FFC012;
  
  //boolean value to see if the player gone through before
  boolean object1_rectangle = false;
  boolean object2_triangle = false;
  boolean object3_ellipse = false;
  
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
  
  //see if player collided with any one of the enemy
  boolean checkCollisionWithEnemy()
  {
    //check for collision with player
    if(dist(px, py, top_left_x, top_left_y) < pSz)
    {
      top_left_speed = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      return true;//there was a collision        
    }else if(dist(px, py, top_right_x, top_right_y) < pSz)
    {
      top_right_speed = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      return true;//there was a collision        
    }else if(dist(px, py, bottom_right_x, bottom_right_y) < pSz)
    {
      bottom_right_speed = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      return true;//there was a collision        
    }else if(dist(px, py, bottom_left_x, bottom_left_y) < pSz)
    {
      bottom_left_speed = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      return true;//there was a collision        
    }
    
    return false;//no collision detected
  }
  
  //see if player collided with any one of the enemy
  boolean touchDownWithObject()
  {
    //check if player touch down any of the object
    if(dist(px, py, rectangle_x, rectangle_y) < pSz)
    {
      object1_rectangle = true;
    }else if(dist(px, py, triangle_x, triangle_y) < pSz)
    {
      object2_triangle = true;
    }else if(dist(px, py, ellipse_x, ellipse_y) < pSz)
    {
      object3_ellipse = true;
    }

    if(object1_rectangle && object2_triangle && object3_ellipse)
    {
      return true;
    }

    return false;
  }
}