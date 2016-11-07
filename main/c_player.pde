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
  boolean object1_pineapple = false;
  boolean object2_apple = false;
  
  //Pen as the airplane control by player
  void drawPlayer()
  {
    pushMatrix();
    translate(px, py);
    noStroke();
    fill(#000000);//black
    quad(39,97,52,97,54,107,37,107);//top of the pen part 1(shadow)
    triangle(36,107,55,107,46,119);//top of the pen part 2(shadow)
    fill(#D4E4FA);// light silver
    quad(42,97,49,97,52,107,39,107);//top of the pen part 1
    triangle(39,105,52,105,46,113);//top of the pen part 2
    stroke(#000000);//black
    strokeWeight(3);//stroke weight thick
    ellipse(45,103,2,2);//detail on top of the pen part1
    strokeWeight(1.5);//stroke weight thin/
    line(45,100,45,118);//detail on the top of the pen part2
    strokeWeight(3);//stroke weight thick
    fill(#D0E3E8);///silver
    ellipse(45,30,18,18);//end of the pen
    fill(#1153AD);//dark blue
    rect(45,60,17.5,55);//body of the pen
    fill(#0B3C7E);//darker blue
    rect(42.5,60,4,55);//shadow of pen's body
    rect(52.5,60,4,55);//shadow of pen's body
    fill(#71A7F2);//lightblue
    quad(37,90,51,90,49,95,39,95);//space between pen's body and top of the pen
    fill(#D4E4FA);// light silver
    popMatrix();
  }
  
  //randomize player pos in the screen
  void randomizePlayer()
  {
    px = random(BUFFSPACE, width - BUFFSPACE);
    py = random(BUFFSPACE, height - BUFFSPACE);
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
       //top left point
    if(dist(px, py, top_left_x, top_left_y-35) < pSz ||
       //top right point
       dist(px, py, top_left_x+76, top_left_y-35) < pSz ||
       //bottom right point
       dist(px, py, top_left_x+76, top_left_y+25) < pSz ||
       //bottom left point
       dist(px, py, top_left_x, top_left_y+25) < pSz)
    {
      top_left_speed = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      return true;//there was a collision
             //top left point
    }else if(dist(px, py, top_right_x, top_right_y-35) < pSz ||
       //top right point
       dist(px, py, top_right_x+76, top_right_y-35) < pSz ||
       //bottom right point
       dist(px, py, top_right_x+76, top_right_y+25) < pSz ||
       //bottom left point
       dist(px, py, top_right_x, top_right_y+25) < pSz)
    {
      top_right_speed = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      return true;//there was a collision
             //top left point
    }else if(dist(px, py, bottom_right_x, bottom_right_y-35) < pSz ||
       //top right point
       dist(px, py, bottom_right_x+76, bottom_right_y-35) < pSz ||
       //bottom right point
       dist(px, py, bottom_right_x+76, bottom_right_y+25) < pSz ||
       //bottom left point
       dist(px, py, bottom_right_x, bottom_right_y+25) < pSz)
    {
      bottom_right_speed = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      return true;//there was a collision
             //top left point
    }else if(dist(px, py, bottom_left_x, bottom_left_y-35) < pSz ||
       //top right point
       dist(px, py, bottom_left_x+76, bottom_left_y-35) < pSz ||
       //bottom right point
       dist(px, py, bottom_left_x+76, bottom_left_y+25) < pSz ||
       //bottom left point
       dist(px, py, bottom_left_x, bottom_left_y+25) < pSz)
    {
      bottom_left_speed = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      return true;//there was a collision
    }
    
    return false;//no collision detected
  }
  
  //see if player collided with any one of the object
  boolean touchDownWithObject()
  {
    //check if player touch down any of the object
    if(dist(px, py, pineapple_x, pineapple_y) < pSz)
    {
      object1_pineapple = true;
    }else if(dist(px, py, apple_x, apple_y) < pSz)
    {
      object2_apple = true;
    }

    if(object1_pineapple && object2_apple)
    {
      return true;
    }

    return false;
  }
}