class Player{
  
  int xpos; 
  int ypos;
  int computerLives = 3;
  int playerLives = 3;
  float distanceToShift = 5;
  float directionChecker = 1.0; // 1.0 for positive ,-1.0 for negative 
  float previousXPos = 0.0;// record the prvious position to change next state poistion
  color paddlecolor = color(255);

  Player(int screen_y)
  {
    // constructor 
    xpos=SCREENX/2;
    ypos=screen_y;
  }

  void move(int x)
  {
  
    //This prevents the paddle running off the screen
    if(x>(SCREENX - PADDLEWIDTH)) 
    {
      xpos = (SCREENX - PADDLEWIDTH);
      previousXPos = xpos;
    }
    
    //This moves the paddle to the mouseX value
    else 
    {
      xpos=x;
      previousXPos = xpos;
    }
  
  }
  // extra credit 1
  void directionChange()
  {
    if(previousXPos>mouseX)
    {
      directionChecker *= -1;
    }
    
    else
    {
      directionChecker *= 1;
    }
  }

  void draw()
  {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  //question 2 
  void compMove(float ballX)
  {
    
    //This controls the movement of the computer paddle, causes the shift distance to increase over time
    if( xpos >= ballX ) {
      xpos-=(distanceToShift);
      distanceToShift+= 0.025;
    }
    
    //This controls the movement of the computer paddle, causes the shift distance to increase over time
    else if( xpos <= ballX)
    {
      xpos+=(distanceToShift);
      distanceToShift+= 0.025;
      
    }
  }
}
