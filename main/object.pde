//global variables

//pineapple: pos
int pineapple_x;
int pineapple_y;

//apple: pos
int apple_x;
int apple_y;

//pineapple as passing point 1
void drawPineapple()
{
  noStroke();
  fill(#B4EDC4);//white lighe green
  stroke(#066722);//dark green for leaves
  fill(#05A533);//light green for leaves
  triangle(179,23,159,48,172,63);//leaves no.1
  triangle(163,17,154,45,172,60);//leaves no.2
  triangle(146,22,148,50,162,47);//leaves no.3
  triangle(186,37,161,58,178,64);//leaves no.4
  triangle(157,30,151,56,169,56);//leaves no.5
  triangle(140,38,148,58,160,54);//leaves no.6
  stroke(#4D050A);//Brown
  strokeWeight(4);//thick line
  fill(#FCCA12);//pineapple colour
  ellipse(160,80,55,60);//pineapple bodY
  fill(#4D050A);//BROWN
  ellipse(159,76,2,2);//detail dot 1
  ellipse(172,66,2,2);//detail dot 2
  ellipse(181,81,2,2);//detail dot 3
  ellipse(149,63,2,2);//detail dot 4
  ellipse(136,74,2,2);//detail dot 5
  ellipse(147,86,2,2);//detail dot 6
  ellipse(158,101,2,2);//detail dot 7
  ellipse(169,91,2,2);//detail dot 8
  stroke(#FC8712);//orange colour for pineapple detail
  line(166,53,134,78);//detail line 1
  line(180,63,139,98);//detail line 2
  line(185,82,154,109);//detail line 3
  line(159,53,184,92);//detail line 4
  line(143,61,174,106);//detail line 5
  line(136,76,158,109);//detail line 6
}

//pineapple as passing point 1 at pos pineapple_x and pineapple_y
void drawPineappleAtPos()
{
  pushMatrix();
  translate(pineapple_x, pineapple_y);
  drawPineapple();
  popMatrix();
}

//draw a randomly positioned pineapple (object)
void drawRandPineapple()
{
  pushMatrix();
  pineapple_x = int(random(0, width - 200));
  pineapple_y = int(random(0, height - 120));
  translate(pineapple_x, pineapple_y);
  drawPineapple();
  popMatrix();
}

//apple as passing point 2 at pos apple_x and apple_y
void drawAppleAtPos()
{
  pushMatrix();
  translate(apple_x, apple_y);
  drawApple();
  popMatrix();
}

//apple as the passing point 2
void drawApple()
{
  noStroke();
  fill(#FFFFFF);//white
  stroke(#066722);//dark green for leaves
  fill(#05A533);//light green for leaves
  ellipse(292,44,18,8);// green leaves
  noStroke();
  fill(#B7071F);//apple dark red (shadow)
  ellipse(282,56,25,10);// apple body part 3
  stroke(#000000);//black
  strokeWeight(5);//thick line for apple's stem
  line(284,35,278,69);//apple's stem
  noStroke();
  fill(#B7071F);//apple dark red (shadow)
  ellipse(273-4,80,45,48+8);//apple body part 1
  ellipse(287+4,80,45,48+8);//apple body part 2
  fill(#E80C29);//apple red colour
  ellipse(273,80,45,48);//apple body part 1
  ellipse(287,80,45,48);//apple body part 2
  stroke(#000000);//black
  strokeWeight(4);//thick line for apple's bottom
  line(276,103,282,103);//apple's bottom
}

//draw a randomly positioned pineapple (object)
void drawRandApple()
{
  pushMatrix();
  apple_x = int(random(0, width - 320));
  apple_y = int(random(0, height - 120));
  translate(apple_x, apple_y);
  drawApple();
  popMatrix();
}

//singer as the enemy goes around 
void drawEnemy(int x, int y)
{
  pushMatrix();
  translate(x, y);
  noStroke();
  fill(#B4EDC4);//light green
  fill(#000000);//black hair colour
  rect(50,37,80,50);//hair part 1
  fill(#FADA9A);//face colour
  rect(50,60,76,60);//face
  fill(#000000);//black hair colour
  rect(16,27,12,30);//hair part 2
  rect(84,27,12,30);//hair part 3
  stroke(#FFFFFF);//white glass
  strokeWeight(2);
  fill(#C9C6BF,110);//faint glasses colour
  line(10,50,90,50);//line for the glass frame
  quad(55,50,85,50,83,65,57,65);//left glass
  quad(15,50,45,50,43,65,17,65);//left glass
  stroke(#000000);//black for eyebrow and mustache
  strokeWeight(5);//heavy eyebrow
  line(22,41,41,38);//left eyebrow
  line(60,43,77,45);//right eyebrow
  strokeWeight(2);
  line(38,72,48,72);//left mustache
  line(52,72,62,72);//right mustache
  fill(#000000);//black colour for mouth
  rect(50,77,20,2); //mouth part 1
  ellipse(50,79,20,3);//mouth part 2
  noStroke();
  fill(#AD031A);// red colour for tongue
  ellipse(50,79,15,2);//tongue
  popMatrix();
}

//wood Board as the landing and starting point of the pencil
void drawWoodBoard()
{
  pushMatrix();
  translate(player.originalPx+5, player.originalPy+20);
  noStroke();
  stroke(#93651B);//darkbrown
  strokeWeight(3);//thick line
  fill(#DBAF75);//light brown for board
  rect(40,52,80,70);//wood board
  noFill();
  ellipse(60,36,10,8);//detail circle no. 1
  ellipse(60,36,20,15);//detail circle no.1.1
  ellipse(60,36,30,25);//detail circle no. 1.2
  line(0,37,80,37);//detail line 1 on board
  line(0,63,80,63);//detail line 2 on board
  line(0,30,27,30);//detail line 3 on board
  line(15,23,22,23);//detail line 4 on board
  line(29,23,47,23);//detail line 5 on board
  fill(#DBAF75);//light brown for board
  rect(40,50,80,26);//wood board
  noFill();
  ellipse(26,47,15,2);//detail circle no.2
  ellipse(26,47,24,10);//detail circle no.2.1
  ellipse(26,47,38,18);//detail circle no.2.2
  line(58,50,80,50);//detail line 6 on board
  line(46,58,61,58);//detail line 7 on board
  line(10,76,22,76);//detail line 8 on board
  line(26,76,32,76);//detail line 9 on board
  line(36,76,40,76);//detail line 10 on board
  line(52,73,73,73);//detail line 11 on board
  line(72,80,80,80);//detail line 12 on board
  popMatrix();
}

//Gameover symbol when player lost the game
void drawGameOver()
{
  noStroke();
  fill(#FFFFFF);//white
  rect(590,250,300,100);///setting the size no bigger tahn this size
  textSize(80);//Bigger Size FrontCharacter
  fill(#E81E2C);//red
  text("G",450,280);////LETTER G
  fill(#F5D207);//yellowish orange
  text("O",600,280);//letter O
  textSize(70);//smaller size other Character
  fill(#1274FA);//blue
  text("a",495,280);//letter a
  fill(#FAE70F);//yellow
  text("m",530,280);//letter m
  fill(#2BCB0C);//green
  text("e",575,280);//letter e
  fill(#29AD23);//darker green
  text("v",660,280);//letter v
  fill(#324CD8);//darker blue
  text("e",680,280);//letter e
  fill(#E81E2C);//red
  text("r",710,280);
}

//Won symbol when player wons the game
void drawWon()
{
  noStroke();
  fill(#FFFFFF);//white
  rect(590,250,500,100);///setting the size no bigger tahn this size
  textSize(80);//Bigger Size FrontCharacter
  fill(#2BCB0C);//green
  text("Y",430,280);//letter Y
  fill(#29AD23);//darker green
  text("o",460,280);//letter o
  fill(#324CD8);//darker blue
  text("u",500,280);//letter u
  fill(#E81E2C);//red
  text("W",550,280);////LETTER W
  fill(#F5D207);//yellowish orange
  text("o",605,280);//letter o
  fill(#1274FA);//blue
  text("n",645,280);//letter n
  fill(#E81E2C);//blue
  text("!",685,280);//letter n
  fill(#E81E2C);//blue
  text("!",705,280);//letter n
}