class c_player
{
  int pSz = 30;//player size
  float px;//player's x position
  float py;//player's y position
  float originalPx;//player's original x position
  float originalPy;//player's original y position
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
    originalPx = px;
    originalPy = py;
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
    //make sure the top left starting point for the enemy is the same with the pen
    int new_top_left_x = top_left_x - 35;
    int new_top_left_y = top_left_y - 19;
    //make sure the top right starting point for the enemy is the same with the pen
    int new_top_right_x = top_right_x - 35;
    int new_top_right_y = top_right_y - 19;
    //make sure the bottom right starting point for the enemy is the same with the pen
    int new_bottom_right_x = bottom_right_x - 35;
    int new_bottom_right_y = bottom_right_y - 19;
    //make sure the bottom left starting point for the enemy is the same with the pen
    int new_bottom_left_x = bottom_left_x - 35;
    int new_bottom_left_y = bottom_left_y - 19;
    //top left enemy
    if(
     //top left point of pen
     (px >= new_top_left_x && px <= new_top_left_x+80 && py >= new_top_left_y && py <= new_top_left_y+77) ||
     //top right point of pen
     (px+17.5 >= new_top_left_x && px+17.5 <= new_top_left_x+80 && py >= new_top_left_y && py <= new_top_left_y+77) ||
     //bottom right point of pen
     (px+17.5 >= new_top_left_x && px+17.5 <= new_top_left_x+80 && py+98 >= new_top_left_y && py+98 <= new_top_left_y+77) ||
     //bottom left point of pen
     (px >= new_top_left_x && px <= new_top_left_x+80 && py+98 >= new_top_left_y && py+98 <= new_top_left_y+77) ||
     //middle left point of pen
     (px >= new_top_left_x && px <= new_top_left_x+80 && py+49 >= new_top_left_y && py+49 <= new_top_left_y+77) ||
     //middle right point of pen
     (px+17.5 >= new_top_left_x && px+17.5 <= new_top_left_x+80 && py+49 >= new_top_left_y && py+49 <= new_top_left_y+77)
    )
    {
      top_left_speed = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      return true;//there was a collision
    //top right enemy
    }else if(
     //top left point of pen
     (px >= new_top_right_x && px <= new_top_right_x+80 && py >= new_top_right_y && py <= new_top_right_y+77) ||
     //top right point of pen
     (px+17.5 >= new_top_right_x && px+17.5 <= new_top_right_x+80 && py >= new_top_right_y && py <= new_top_right_y+77) ||
     //bottom right point of pen
     (px+17.5 >= new_top_right_x && px+17.5 <= new_top_right_x+80 && py+98 >= new_top_right_y && py+98 <= new_top_right_y+77) ||
     //bottom left point of pen
     (px >= new_top_right_x && px <= new_top_right_x+80 && py+98 >= new_top_right_y && py+98 <= new_top_right_y+77) ||
     //middle left point of pen
     (px >= new_top_right_x && px <= new_top_right_x+80 && py+49 >= new_top_right_y && py+49 <= new_top_right_y+77) ||
     //middle right point of pen
     (px+17.5 >= new_top_right_x && px+17.5 <= new_top_right_x+80 && py+49 >= new_top_right_y && py+49 <= new_top_right_y+77)
    )
    {
      top_right_speed = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      return true;//there was a collision
             //top left point
    //bottom right enemy
    }else if(
     //top left point of pen
     (px >= new_bottom_right_x && px <= new_bottom_right_x+80 && py >= new_bottom_right_y && py <= new_bottom_right_y+77) ||
     //top right point of pen
     (px+17.5 >= new_bottom_right_x && px+17.5 <= new_bottom_right_x+80 && py >= new_bottom_right_y && py <= new_bottom_right_y+77) ||
     //bottom right point of pen
     (px+17.5 >= new_bottom_right_x && px+17.5 <= new_bottom_right_x+80 && py+98 >= new_bottom_right_y && py+98 <= new_bottom_right_y+77) ||
     //bottom left point of pen
     (px >= new_bottom_right_x && px <= new_bottom_right_x+80 && py+98 >= new_bottom_right_y && py+98 <= new_bottom_right_y+77) ||
     //middle left point of pen
     (px >= new_bottom_right_x && px <= new_bottom_right_x+80 && py+49 >= new_bottom_right_y && py+49 <= new_bottom_right_y+77) ||
     //middle right point of pen
     (px+17.5 >= new_bottom_right_x && px+17.5 <= new_bottom_right_x+80 && py+49 >= new_bottom_right_y && py+49 <= new_bottom_right_y+77)
    )
    {
      bottom_right_speed = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      return true;//there was a collision
    //bottom left
    }else if(
     //top left point of pen
     (px >= new_bottom_left_x && px <= new_bottom_left_x+80 && py >= new_bottom_left_y && py <= new_bottom_left_y+77) ||
     //top right point of pen
     (px+17.5 >= new_bottom_left_x && px+17.5 <= new_bottom_left_x+80 && py >= new_bottom_left_y && py <= new_bottom_left_y+77) ||
     //bottom right point of pen
     (px+17.5 >= new_bottom_left_x && px+17.5 <= new_bottom_left_x+80 && py+98 >= new_bottom_left_y && py+98 <= new_bottom_left_y+77) ||
     //bottom left point of pen
     (px >= new_bottom_left_x && px <= new_bottom_left_x+80 && py+98 >= new_bottom_left_y && py+98 <= new_bottom_left_y+77) ||
     //middle left point of pen
     (px >= new_bottom_left_x && px <= new_bottom_left_x+80 && py+49 >= new_bottom_left_y && py+49 <= new_bottom_left_y+77) ||
     //middle right point of pen
     (px+17.5 >= new_bottom_left_x && px+17.5 <= new_bottom_left_x+80 && py+49 >= new_bottom_left_y && py+49 <= new_bottom_left_y+77)
    )
    {
      bottom_left_speed = random(-9, 9);//randomize the bouncy square's angular speed to visually show the collision occur (user feedback)
      return true;//there was a collision
    }
    
    return false;//no collision detected
  }
  
  //see if player collided with any one of the object
  boolean touchDownWithObject()
  {
    //make sure the pineapple position is the same with the pen
    int new_pineapple_x = pineapple_x + 93;
    int new_pineapple_y = pineapple_y - 2;
    //make sure the pineapple position is the same with the pen
    int new_apple_x = apple_x + 248;
    int new_apple_y = apple_y + 38;
    //make sure the pineapple position is the same with the pen
    int new_originalPx = int(originalPx - 43);
    int new_originalPy = int(originalPy - 18);
    //check if player touch down any of the object
    //check for pineapple
    if(
     //top left point of pen
     (px >= new_pineapple_x && px <= new_pineapple_x && py >= new_pineapple_y && py <= new_pineapple_y+90) ||
     //top right point of pen
     (px+17.5 >= new_pineapple_x && px+17.5 <= new_pineapple_x+60 && py >= new_pineapple_y && py <= new_pineapple_y+90) ||
     //bottom right point of pen
     (px+17.5 >= new_pineapple_x && px+17.5 <= new_pineapple_x+60 && py+98 >= new_pineapple_y && py+98 <= new_pineapple_y+90) ||
     //bottom left point of pen
     (px >= new_pineapple_x && px <= new_pineapple_x+60 && py+98 >= new_pineapple_y && py+98 <= new_pineapple_y+90) ||
     //middle left point of pen
     (px >= new_pineapple_x && px <= new_pineapple_x+60 && py+49 >= new_pineapple_y && py+49 <= new_pineapple_y+90) ||
     //middle right point of pen
     (px+17.5 >= new_pineapple_x && px+17.5 <= new_pineapple_x+60 && py+49 >= new_pineapple_y && py+49 <= new_pineapple_y+90)
    )
    {
      object1_pineapple = true;
    //check for apple
    }else if(
     //top left point of pen
     (px >= new_apple_x && px <= new_apple_x+60 && py >= new_apple_y && py <= new_apple_y+80) ||
     //top right point of pen
     (px+17.5 >= new_apple_x && px+17.5 <= new_apple_x+60 && py >= new_apple_y && py <= new_apple_y+80) ||
     //bottom right point of pen
     (px+17.5 >= new_apple_x && px+17.5 <= new_apple_x+60 && py+98 >= new_apple_y && py+98 <= new_apple_y+80) ||
     //bottom left point of pen
     (px >= new_apple_x && px <= new_apple_x+60 && py+98 >= new_apple_y && py+98 <= new_apple_y+80) ||
     //middle left point of pen
     (px >= new_apple_x && px <= new_apple_x+60 && py+49 >= new_apple_y && py+49 <= new_apple_y+80) ||
     //middle right point of pen
     (px+17.5 >= new_apple_x && px+17.5 <= new_apple_x+60 && py+49 >= new_apple_y && py+49 <= new_apple_y+80)
    )
    {
      object2_apple = true;
    }

    if(object1_pineapple && object2_apple)
    {
      //check for wood board
      if(
        //top left point of pen
        (px >= new_originalPx && px <= new_originalPx+83 && py >= new_originalPy && py <= new_originalPy+112) ||
        //top right point of pen
        (px+17.5 >= new_originalPx && px+17.5 <= new_originalPx+83 && py >= new_originalPy && py <= new_originalPy+112) ||
        //bottom right point of pen
        (px+17.5 >= new_originalPx && px+17.5 <= new_originalPx+83 && py+98 >= new_originalPy && py+98 <= new_originalPy+112) ||
        //bottom left point of pen
        (px >= new_originalPx && px <= new_originalPx+83 && py+98 >= new_originalPy && py+98 <= new_originalPy+112) ||
        //middle left point of pen
        (px >= new_originalPx && px <= new_originalPx+83 && py+49 >= new_originalPy && py+49 <= new_originalPy+112) ||
        //middle right point of pen
        (px+17.5 >= new_originalPx && px+17.5 <= new_originalPx+83 && py+49 >= new_originalPy && py+49 <= new_originalPy+112)
      )
      {
        return true;
      }
    }

    return false;
  }
}