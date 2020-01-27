Player thePlayer;
Player computerPlayer;
Ball theBall;

final int SCREENX = 1280;
final int SCREENY = 720;
final int PADDLEHEIGHT = 30;
final int PADDLEWIDTH = 300;
final int MARGIN = 15;
boolean gameStart = false;

void setup()
{
  
  size(1280,720);
  thePlayer = new Player(SCREENY-PADDLEHEIGHT-MARGIN);
  computerPlayer = new Player(MARGIN);
  theBall = new Ball();
  ellipseMode(5);
  frameRate(60);
}

void draw() 
{
    
  background(#59ED11);
  thePlayer.draw();
  computerPlayer.draw();
  // question 4
  //This sets up the middle boundary and displays the lives
  rect(0, 360, 1280, 2.5);
  textSize(50);
  fill(20, 192, 37);
  text("Computer Lives are "+computerPlayer.computerLives , 20, 300);
  fill(255, 27, 192);
  text("The player lives are "+thePlayer.playerLives , 20, 450);
  
  if (gameStart == true)
  {
    
    thePlayer.draw();
    computerPlayer.draw();
    theBall.draw();
    thePlayer.move(mouseX);
    computerPlayer.compMove(theBall.x);
    theBall.move();
    theBall.collide(thePlayer);
    theBall.computerCollide(computerPlayer);
  }
  
  else{
    
    //This displays GAME OVER message
    if(thePlayer.playerLives == 0)
    {
      fill(255);
      textSize(50);
      text("GAME OVER! and Computer win(Oppps)", 500, 250);
      text("Press Mouse Key to Play Again", 350, 350);
      
    }
    
    //This displayes YOU WIN message
    else if(computerPlayer.computerLives == 0)
    {
      fill(255);
      textSize(50);
      text("Cogruation YOU WIN! ", 500, 250);
      text("Press Mouse Key to Play Again", 350, 350);
    }
    
    //This displays the start message
    else
    {
      fill(255);
      textSize(50);
      text("Press Mouse Key to Play", 350, 350);
    }
  }
}
//question 3 
  void mousePressed() 
  {
    
    //This resets the start boolean and dx dy parameters for the ball
    gameStart = !gameStart;
    theBall.dy = random(5, 10);
    theBall.dx= random(5, 10);
    
    //This resets the lives 
    if(computerPlayer.computerLives == 0)
    {
      computerPlayer.computerLives = 3;
      thePlayer.playerLives = 3;
    }
    
    //This resets the lives
    if(thePlayer.playerLives == 0)
    {
      computerPlayer.computerLives = 3;
      thePlayer.playerLives = 3;
    }
}
