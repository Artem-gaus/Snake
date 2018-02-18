//size rectangle = 8px
int snakeSize; 
int [] posx = new int[2500];
int [] posy = new int[2500];
int applex;
int appley;
int angle;
int time; 

void setup()
{
  size(400, 400);
  Restart();
  fill(125);
  noStroke();
}

void draw()
{
  time++;

  if ((time % 5) == 0)
  {
    Display();
    Travel();
    Checked();
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode==UP && angle!=270)
    {
      angle = 90;
    }
    if (keyCode==DOWN && angle!=90)
    {
      angle = 270;
    }
    if (keyCode==LEFT && angle!=0)
    {
      angle = 180;
    }
    if (keyCode==RIGHT && angle!=180)
    {
      angle = 0;
    }
  }
}
void Travel()
{
  for (int i=snakeSize-1; i>=0; i--)
  {
    if (i!=0)
    {
      posx[i] = posx[i-1];
      posy[i] = posy[i-1];
    } else
    {
      switch(angle)
      {
      case 0:
        posx[0] += 8;
        break;
      case 90:
        posy[0] -= 8;
        break;
      case 180:
        posx[0] -= 8;
        break;
      case 270:
        posy[0] += 8;
        break;
      }
    }
  }
  for (int i=0; i<snakeSize; i++)
  {
    fill(50, 200, 100);
    rect(posx[i], posy[i], 8, 8);
  }
}
void Checked()
{
  if (posx[0]==applex && posy[0]==appley)
  {
    snakeSize++;
    GenApple();
  }
}
void Display()
{
  background(228);
  fill(230, 50, 100);
  rect(applex, appley, 8, 8, 2);
  fill(50);
  rect(0, 0, width, 8);
  rect(width-8, 8, 8, height);
  rect(0, height-8, width, 8);
  rect(0, 0, 8, height);
}
void GenApple()
{
  applex = ((int)(random(1, 47)))*8;
  appley = ((int)(random(1, 47)))*8;
}
void Restart()
{
  background(255);
  angle = 0;
  snakeSize = 1;
  time = 0;
  GenApple();
  posx[0] = 23*8;
  posy[0] = 23*8;
}