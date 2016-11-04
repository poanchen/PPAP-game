//global variables
int fc = 0;//frame counter, 60x per sec
int toSec = 0;
int secLeft = 0;
boolean isRunning = false;//if game is running, things move
boolean resetObjects = false;//if user right clicked the mouse, we then reset the position of all the objects
boolean isLost = false;
boolean isWon = false;

//enemy position
//top left
int top_left_x = 40;
int top_left_y = 30;
float top_left_x_v = random(-5, 5);
float top_left_y_v = random(-5, 5);
//top right
int top_right_x = 1160;
int top_right_y = 30;
float top_right_x_v = random(-5, 5);
float top_right_y_v = random(-5, 5);
//bottom right
int bottom_right_x = 1160;
int bottom_right_y = 860;
float bottom_right_x_v = random(-5, 5);
float bottom_right_y_v = random(-5, 5);
//bottom left
int bottom_left_x = 40;
int bottom_left_y = 860;
float bottom_left_x_v = random(-5, 5);
float bottom_left_y_v = random(-5, 5);

//rectangles: colour, pos, size
int rectangle_r;
int rectangle_g;
int rectangle_b;
float rectangle_x;
float rectangle_y;
float rectangle_w;
float rectangle_h;
//triangle: colour, pos, size
int triangle_r;
int triangle_g;
int triangle_b;
float triangle_x;
float triangle_y;
//ellipse: colour, pos, size
int ellipse_r;
int ellipse_g;
int ellipse_b;
float ellipse_x;
float ellipse_y;

//constant variables

//background color
color LIGHTBLUE = #CCEEFF;
color PURPLE1 = #551A28;
color PURPLE2 = #551A3C;
color PURPLE3 = #551A50;
color PURPLE4 = #551A6E;

//player object
c_player player = new c_player();

void setup()
{
  size(1200, 900);//set window size
  rectMode(CENTER);
  background(LIGHTBLUE);
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
    
    if(isLost)
    {
      isLost = false;
    }
    
    if(isWon)
    {
      isWon = false;
    }
  }
  
  if(resetObjects)
  {
    background(LIGHTBLUE);
    resetAll();
    resetObjects = false;
  }

  player.drawPlayer();
  drawMovingEnemy();
}

void lose()
{
  isRunning = false;
  resetObjects = true;
  fc = 0;
  isLost = true;
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
  fill(rectangle_r, rectangle_g, rectangle_b);
  drawRect(rectangle_x, rectangle_y, rectangle_w, rectangle_h);
  fill(triangle_r, triangle_g, triangle_b);
  drawTri(triangle_x, triangle_y, triangle_x+28, triangle_y-55, triangle_x+56, triangle_y);
  fill(ellipse_r, ellipse_g, ellipse_b);
  drawElli(ellipse_x, ellipse_y, 55, 55);
}

void resetAll()
{
  player.object1_rectangle = false;
  player.object2_triangle = false;
  player.object3_ellipse = false;
  player.randomizePlayer();
  drawRandRect();
  drawRandTri();
  drawRandElli();
  drawCornerEnemy();
}

//draw a randomly positioned and coloured rect (enemy)
void drawRandRect()
{
  //randomize colour
  rectangle_r = int(random(22, 222));//rand RGB colour for R
  rectangle_g = int(random(22, 222));//rand RGB colour for G
  rectangle_b = int(random(22, 222));//rand RGB colour for B
  
  //randomize position and size
  rectangle_x = random(60, width - 60);//rand pos for the top left
  rectangle_y = random(60, height - 60);
  rectangle_w = random(33, 120);//random width
  rectangle_h = random(33, 120);//random height

  fill(rectangle_r, rectangle_g, rectangle_b);
  drawRect(rectangle_x, rectangle_y, rectangle_w, rectangle_h);
}

//draw a randomly positioned and coloured triangle (enemy)
void drawRandTri()
{
 //randomize colour
 triangle_r = int(random(22, 222));//rand RGB colour for R
 triangle_g = int(random(22, 222));//rand RGB colour for G
 triangle_b = int(random(22, 222));//rand RGB colour for B
  
 //randomize position and size
 triangle_x = random(60, width - 60);
 triangle_y = random(60, height - 60);

 fill(triangle_r, triangle_g, triangle_b);
 drawTri(triangle_x, triangle_y, triangle_x+28, triangle_y-55, triangle_x+56, triangle_y);
}

//draw a randomly positioned and coloured ellipse (enemy)
void drawRandElli()
{
 //randomize colour
 ellipse_r = int(random(22, 222));//rand RGB colour for R
 ellipse_g = int(random(22, 222));//rand RGB colour for G
 ellipse_b = int(random(22, 222));//rand RGB colour for B
  
 //randomize position and size
 ellipse_x = random(60, width - 60);//rand pos for the top left
 ellipse_y = random(60, height - 60);

 fill(ellipse_r, ellipse_g, ellipse_b);
 drawElli(ellipse_x, ellipse_y, 55, 55);
}

void drawCornerEnemy()
{
  //top left
  top_left_x = 40;
  top_left_y = 30;
  //top right
  top_right_x = 1160;
  top_right_y = 30;
  //bottom right
  bottom_right_x = 1160;
  bottom_right_y = 860;
  //bottom left
  bottom_left_x = 40;
  bottom_left_y = 860;

  //top left
  fill(PURPLE1);
  drawEnemy(top_left_x, top_left_y);
  //top right
  fill(PURPLE2);
  drawEnemy(top_right_x, top_right_y);
  //bottom right
  fill(PURPLE3);
  drawEnemy(bottom_right_x, bottom_right_y);
  //bottom left
  fill(PURPLE4);
  drawEnemy(bottom_left_x, bottom_left_y);
}

void drawRect(float x, float y, float w, float h)
{
  rect(x, y, w, h);
}

void drawTri(float x_1, float y_1, float x_2, float y_2, float x_3, float y_3)
{
  triangle(x_1, y_1, x_2, y_2, x_3, y_3);
}

void drawElli(float x,float y, float w, float h)
{
  ellipse(x, y, w, h);
}

void drawEnemy(int x, int y)
{
  arc(x, y, 80, 80, 0, PI+QUARTER_PI, PIE);
}