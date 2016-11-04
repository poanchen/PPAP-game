//global variables
int fc = 0;//frame counter, 60x per sec
boolean isRunning = false;//if game is running, things move

//random rectangles: colour, pos, size
int rrr;//colour components: red, green, blue
int rrg;
int rrb;
float rrx;//rand rect pos x, y
float rry;
float rrw;//size, width and height
float rrh;

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
  player.randomizePlayer();
}

void draw()
{
  //60 frames per second
  //only 30*60 frames allowed to play the game
  if(fc > 30*60)
  {
    println("You lost the game as your time exceeds 30 seconds!");
    isRunning = false;
  }
  
  if(isRunning)
  {
    fc++;//another frame is about to be drawn
    player.movePlayerFollowMouse();
    println("time spent " + fc/60 + " seconds.");
  }
  else
  {
    println("game isn't running");
  }
  
  //draw all, all the time
  player.drawPlayer();
}

//draw a randomly positioned and coloured rect (enemy)
void drawRandRect()
{
  //randomize colour
  rrr = int(random(22, 222));//rand RGB colour for R
  rrg = int(random(22, 222));//rand RGB colour for G
  rrb = int(random(22, 222));//rand RGB colour for B
  
  //randomize position and size
  rrx = random(60, width - 60);//rand pos for the top left
  rry = random(60, height - 60);
  rrw = random(33, 120);//random width
  rrh = random(33, 120);//random height

  fill(rrr, rrg, rrb);
  drawRect(rrx, rry, rrw, rrh);
}

//draw a randomly positioned and coloured triangle (enemy)
void drawRandTri()
{
  //randomize colour
  rrr = int(random(22, 222));//rand RGB colour for R
  rrg = int(random(22, 222));//rand RGB colour for G
  rrb = int(random(22, 222));//rand RGB colour for B
  
  //randomize position and size
  rrx = random(60, width - 60);
  rry = random(60, height - 60);

  fill(rrr, rrg, rrb);
  drawTri(rrx, rry, rrx+28, rry-55, rrx+56, rry);
}

//draw a randomly positioned and coloured ellipse (enemy)
void drawRandElli()
{
  //randomize colour
  rrr = int(random(22, 222));//rand RGB colour for R
  rrg = int(random(22, 222));//rand RGB colour for G
  rrb = int(random(22, 222));//rand RGB colour for B
  
  //randomize position and size
  rrx = random(60, width - 60);//rand pos for the top left
  rry = random(60, height - 60);

  fill(rrr, rrg, rrb);
  drawElli(rrx, rry, 55, 55);
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