final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int ALIEN_ALIVE=0;
final int ALIEN_DEAD=16;
final int A_DOWN = 2;

class Alien {
 /* declare variables for alien position, direction of movement and appearance */
 int x;
 int y;
 int dx;
 int dy;
 int downCounter;
 int prevDirection;
 int pathChangeCounter;
 boolean change;// to counter which to transformed
 int pathChangeChecker;
 boolean die ;
 PImage imageToUse;
 
 // for credit 4
 
 boolean bonus;
 int status;
 int xBonus; int yBonus;
 color bonusColor;
 int bonusType;

 /* Constructor is passed the x and y position where the alien is to
 be created, plus the image to be used to draw the alien */
 
 Alien(int xpos, int ypos, PImage alienImage)
 {
    die = false;
    /* set up the new alien object */ 
    x = xpos;
    y = ypos;
    dx = 1;
    dy = 0;
    downCounter = alienImage.height;
    prevDirection = A_BACKWARD;
    pathChangeCounter = 0;
    pathChangeChecker =(int) random(0, (SCREEN_X*8)); // randomly selete the frame number 
    imageToUse = alienImage;
    
    status = ALIEN_ALIVE;
    bonus = false;
 }
 
 
 void moveSinPath()
 {
   if(die == false)
   {
     y+=(int)random(1,2);
     y++;
     println("speed of y"+y);
     if(y>0 && y<120)
     {
       x+=(int)random(1,2);
     }
     if(y>120 && y<240)
     {
       x-=(int)random(1,2);
     }
     if(y>240 && y<360)
     {
       x+=(int)random(1,3);
     }
     if(y>360 && y<480)
     {
       x-=(int)random(1,3);
     }
     if(y>480 && y<600)
     {
       x+=(int)random(1,3);
     }
     if(y>600 && y<720)
     {
       x-=(int)random(1,5);
     }
     
     
     if(x>=1279 || y>=719)
     {
       x= (int)random(1,1000);
       y = (int)random(1,700);
     }
     
   }
   else if(die == true)
    {
       int stopX = x;
        x =stopX;
        int stopY = y;
        y = stopY;
      
    }
    
   
 }
 void move()
 {
    /* Move the alien according to the instructions in the exercise */   
    
    if(die == false)
    {
            if(downCounter == 0 && prevDirection == A_BACKWARD)
      {
        dx=-1; 
        dy=0;
        prevDirection = A_FORWARD;
        downCounter = alienImage.height;
      }
      
      else if(downCounter == 0 && prevDirection == A_FORWARD)
      {
        dx=1;
        dy=0;
        prevDirection = A_BACKWARD;
        downCounter = alienImage.height;
      }
      
      x+=dx;
      y+= dy;
      
      if(x == SCREEN_X-alienImage.width)
      {
        dy=1;
        dx=0;
        downCounter--;
      }
      
      if(x == 0)
      {
        dy=1;
        dx=0;
        downCounter--;
      }
       if(bonus){
       yBonus+= 2;
      }
      
    }
    else if(die == true)
    {
       int stopX = x;
        x =stopX;
        int stopY = y;
        y = stopY;
      
    }
    
     
 }
 
  
  void draw()
  {
    /* Draw the alien using the image() method demonstrated in class */
    image(imageToUse, x, y);  
    pathChangeCounter++;
     
    
  }

  void explode()
  {
      if(die == false)
      {
        imageToUse = explodeImage;
        die = true;
        dieSound.play();
        
      }
      
  }
  
  
  void powerUp(){
     bonusType = (int) random(3);
     println("Current type is"+bonusType);
     bonus = true;
     xBonus = x + alienImage.width / 2;
     yBonus = y + alienImage.height;
     if(bonusType == 0){
       bonusColor = color(255, 100, 0);
     } else if (bonusType == 1){
       bonusColor = color(0, 255, 0);
     } else {
       bonusColor = color(0, 0, 255);
     }
  }
  
    void collisionPowerUp(int xPlayer, int  yPlayer, Player tp){
    if(xBonus - BONUS_WIDTH >= xPlayer && xBonus <= xPlayer + playerImage.width && yBonus + BONUS_HEIGHT >= yPlayer && yBonus <= yPlayer + playerImage.height){
    bonus = false;
    tp.bulletMode = bonusType;
    xBonus = 0;
    yBonus = 0; 
    }
    else if(yBonus >= SCREEN_Y){
     bonus = false;  
     xBonus = 0;
     yBonus = 0; 
     }
   }
  
  
}
