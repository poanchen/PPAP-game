//global variables
int fc = 0;//frame counter, 60x per sec
int toSec = 0;
int secLeft = 0;
boolean isRunning = false;//if game is running, things move
boolean resetObjects = false;//if user right clicked the mouse, we then reset the position of all the objects
boolean isLost = false;
boolean isWon = false;
PFont font;

//enemy position
//top left
int top_left_x = 0;
int top_left_y = 0;
float top_left_x_v = random(-5, 5);
float top_left_y_v = random(-5, 5);
//top right
int top_right_x = 1100;
int top_right_y = 0;
float top_right_x_v = random(-5, 5);
float top_right_y_v = random(-5, 5);
//bottom right
int bottom_right_x = 1100;
int bottom_right_y = 800;
float bottom_right_x_v = random(-5, 5);
float bottom_right_y_v = random(-5, 5);
//bottom left
int bottom_left_x = 0;
int bottom_left_y = 800;
float bottom_left_x_v = random(-5, 5);
float bottom_left_y_v = random(-5, 5);

//constant variables

//background color
color LIGHTBLUE = #CCEEFF;

//player object
c_player player = new c_player();

void setup()
{
  size(1200, 900);//set window size
  rectMode(CENTER);
  background(LIGHTBLUE);
  //load the font for gameover
  font=loadFont("Bauhaus93-48.vlw");
  textFont(font,48);
  resetAll();
}

void draw()
{ 
  //60 frames per second
  //only 30*60 frames allowed to play the game
  if(fc > 30*60)
  {
    println("You lost the game as your time exceeds 30 seconds!");
    lose();
  }
  
  if(isRunning)
  {
    fc++;//another frame is about to be drawn
    player.movePlayerFollowMouse();
    redrawAllObjects(LIGHTBLUE);
    moveEnemy();
    
    if(player.checkCollisionWithEnemy())
    {
      println("You lost the game because one of the enemy hit you!");
      lose();
    }
    
    if(player.touchDownWithObject())
    {
      println("You won the game in " + fc/60 + " seconds. Way to go!!!");
      win();
    }
    
    if(fc % 60 == 0 && !isLost && !isWon)
    {
      toSec = fc/60;
      secLeft = 30 - toSec;
      println("You already spent " + toSec + " seconds. And, you have " + secLeft + " seconds left!");
    }
  }
  
  if(resetObjects)
  {
    background(LIGHTBLUE);
    resetAll();
    resetObjects = false;
    isLost = false;
    isWon = false;
  }

  player.drawPlayer();
  drawMovingEnemy();
}

void lose()
{
  isRunning = false;
  fc = 0;
  isLost = true;
  drawGameOver();
}

void win()
{
  isRunning = false;
  resetObjects = true;
  fc = 0;
  isWon = true;
}

void redrawAllObjects(color bg_color)
{
  background(bg_color);
  drawPineappleAtPos();
  drawAppleAtPos();
  drawWoodBoard();
}

void resetAll()
{
  player.object1_pineapple = false;
  player.object2_apple = false;
  player.randomizePlayer();
  drawRandPineapple();
  drawRandApple();
  drawWoodBoard();
  drawCornerEnemy();
}

void drawCornerEnemy()
{
  //top left
  top_left_x = 0;
  top_left_y = 0;
  //top right
  top_right_x = 1100;
  top_right_y = 0;
  //bottom right
  bottom_right_x = 1100;
  bottom_right_y = 800;
  //bottom left
  bottom_left_x = 0;
  bottom_left_y = 800;

  //top left
  drawEnemy(top_left_x, top_left_y);
  //top right
  drawEnemy(top_right_x, top_right_y);
  //bottom right
  drawEnemy(bottom_right_x, bottom_right_y);
  //bottom left
  drawEnemy(bottom_left_x, bottom_left_y);
}