//global variables
//top left
float top_left_angle = 0;
float top_left_speed = random(-9, 9);
//top right
float top_right_angle = 0;
float top_right_speed = random(-9, 9);
//bottom right
float bottom_right_angle = 0;
float bottom_right_speed = random(-9, 9);
//bottom left
float bottom_left_angle = 0;
float bottom_left_speed = random(-9, 9);

void moveEnemy()
{
  //move all the enemy's position
  //top left
  top_left_x += top_left_x_v;
  top_left_y += top_left_y_v;
  //top right
  top_right_x += top_right_x_v;
  top_right_y += top_right_y_v;
  //bottom right
  bottom_right_x += bottom_right_x_v;
  bottom_right_y += bottom_right_y_v;
  //bottom left
  bottom_left_x += bottom_left_x_v;
  bottom_left_y += bottom_left_y_v;
  
  //top left
  float [] top_left_array = {top_left_x, top_left_x_v, top_left_y, top_left_y_v};
  top_left_array = checkForBounce(top_left_array);
  top_left_x = int(top_left_array[0]);
  top_left_x_v = top_left_array[1];
  top_left_y = int(top_left_array[2]);
  top_left_y_v = top_left_array[3];
  float [] top_left_v_array = {top_left_x_v, top_left_y_v};
  top_left_v_array = limitSpeed(top_left_v_array);//ensure speed is reasonable
  top_left_x_v = top_left_v_array[0];
  top_left_y_v = top_left_v_array[1];
  //top right
  float [] top_right_array = {top_right_x, top_right_x_v, top_right_y, top_right_y_v};
  top_right_array = checkForBounce(top_right_array);
  top_right_x = int(top_right_array[0]);
  top_right_x_v = top_right_array[1];
  top_right_y = int(top_right_array[2]);
  top_right_y_v = top_right_array[3];
  float [] top_right_v_array = {top_right_x_v, top_right_y_v};
  top_right_v_array = limitSpeed(top_right_v_array);//ensure speed is reasonable
  top_right_x_v = top_right_v_array[0];
  top_right_y_v = top_right_v_array[1];
  //bottom right
  float [] bottom_right_array = {bottom_right_x, bottom_right_x_v, bottom_right_y, bottom_right_y_v};
  bottom_right_array = checkForBounce(bottom_right_array);
  bottom_right_x = int(bottom_right_array[0]);
  bottom_right_x_v = bottom_right_array[1];
  bottom_right_y = int(bottom_right_array[2]);
  bottom_right_y_v = bottom_right_array[3];
  float [] bottom_right_v_array = {bottom_right_x_v, bottom_right_y_v};
  bottom_right_v_array = limitSpeed(bottom_right_v_array);//ensure speed is reasonable
  bottom_right_x_v = bottom_right_v_array[0];
  bottom_right_y_v = bottom_right_v_array[1];
  //bottom left
  float [] bottom_left_array = {bottom_left_x, bottom_left_x_v, bottom_left_y, bottom_left_y_v};
  bottom_left_array = checkForBounce(bottom_left_array);
  bottom_left_x = int(bottom_left_array[0]);
  bottom_left_x_v = bottom_left_array[1];
  bottom_left_y = int(bottom_left_array[2]);
  bottom_left_y_v = bottom_left_array[3];
  float [] bottom_left_v_array = {bottom_left_x_v, bottom_left_y_v};
  bottom_left_v_array = limitSpeed(bottom_left_v_array);//ensure speed is reasonable
  bottom_left_x_v = bottom_left_v_array[0];
  bottom_left_y_v = bottom_left_v_array[1];
}

float [] checkForBounce(float [] enemy_pos_array)
{
  int enemy_x = int(enemy_pos_array[0]);
  float enemy_x_v = enemy_pos_array[1];
  int enemy_y = int(enemy_pos_array[2]);
  float enemy_y_v = enemy_pos_array[3];

  if(enemy_x > width || enemy_x < 0)
  {
    enemy_x -= enemy_x_v;//move it back in bounds
    enemy_x_v *= -1;//turn it around
    enemy_x_v *= random(0.5, 2);//make it a bit faster or slower
    enemy_y_v *= random(0.5, 10);
  }
  
  if(enemy_y > height || enemy_y < 0)
  {
    enemy_y -= enemy_y_v;//move it back in bounds
    enemy_y_v *= -1;//reverse
    enemy_x_v *= random(0.5, 10);//make it a bit faster or slower
    enemy_y_v *= random(0.5, 2);
  }
  
  enemy_pos_array[0] = enemy_x;
  enemy_pos_array[1] = enemy_x_v;
  enemy_pos_array[2] = enemy_y;
  enemy_pos_array[3] = enemy_y_v;

  return enemy_pos_array;
}

float [] limitSpeed(float [] enemy_v_array)
{
  float enemy_x_v = enemy_v_array[0];
  float enemy_y_v = enemy_v_array[1];
  
  //ensure speed isn't too fast
  while(dist(0,0, enemy_x_v, enemy_y_v) > 5)
  {
    //reduce speed equally for vx and vy
    //so the direction is preserved
    enemy_x_v *= 0.9;
    enemy_y_v *= 0.9;
  }
  
  //ensure speed isn't too slow
  while(dist(0,0, enemy_x_v, enemy_y_v) < 2)
  {
    //increase speed equally for vx and vy
    //so the direction is preserved
    enemy_x_v *= 1.1;
    enemy_y_v *= 1.1;
  }
  
  enemy_v_array[0] = enemy_x_v;
  enemy_v_array[1] = enemy_y_v;
  
  return enemy_v_array;
}

void drawMovingEnemy()
{
  if(isRunning)
  {
    pushMatrix();
    //top left
    top_left_angle += top_left_speed;
    translate(top_left_x, top_left_y);//put it back
    rotate(radians(top_left_angle));//rotate
    translate(-top_left_x, -top_left_y);//move it to the origin to do a rotation
    drawEnemy(top_left_x, top_left_y);
    popMatrix();
    pushMatrix();
    //top right
    top_right_angle += top_right_speed;
    translate(top_right_x, top_right_y);//put it back
    rotate(radians(top_right_angle));//rotate
    translate(-top_right_x, -top_right_y);//move it to the origin to do a rotation
    drawEnemy(top_right_x, top_right_y);
    popMatrix();
    pushMatrix();
    //bottom right
    bottom_right_angle += bottom_right_speed;
    translate(bottom_right_x, bottom_right_y);//put it back
    rotate(radians(bottom_right_angle));//rotate
    translate(-bottom_right_x, -bottom_right_y);//move it to the origin to do a rotation
    drawEnemy(bottom_right_x, bottom_right_y);
    popMatrix();
    pushMatrix();
    //bottom left
    bottom_left_angle += bottom_left_speed;
    translate(bottom_left_x, bottom_left_y);//put it back
    rotate(radians(bottom_left_angle));//rotate
    translate(-bottom_left_x, -bottom_left_y);//move it to the origin to do a rotation
    drawEnemy(bottom_left_x, bottom_left_y);
    popMatrix();
  }
}