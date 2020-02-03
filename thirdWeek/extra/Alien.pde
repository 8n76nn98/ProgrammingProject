
class Alien {
 /* declare variables for alien position, direction of movement and appearance */
 int x;
 int y;
 int dx;
 boolean hasTransformed;
 int dy;
 int downCounter;
 int prevDirection;
 int explodeCounter;
 int explodeChecker;
 PImage imageToUse;

 /* Constructor is passed the x and y position where the alien is to
 be created, plus the image to be used to draw the alien */
 
 Alien(int xpos, int ypos, PImage alienImage)
 {
    /* set up the new alien object */ 
    x = xpos;
    y = ypos;
    dx = 1;
    dy = 0;
    downCounter = alienImage.height;
    prevDirection = A_BACKWARD;
    explodeCounter = 0;
    explodeChecker =(int) random(0, (SCREEN_X*8));
    hasTransformed = false;
    imageToUse = alienImage;
 }
  
 void moveRegular()
 {
   
   if(hasTransformed==false)
   {
         /* Move the alien according to the instructions in the exercise */   
        
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
   }
   
   
   
     
 }
 
  
  void draw()
  {
    /* Draw the alien using the image() method demonstrated in class */
    image(imageToUse, x, y);  
    explodeCounter++;
  }

  void explode()
  {
    
    if(explodeCounter == explodeChecker)
    {
      hasTransformed = true;
      imageToUse = explodeImage;
    }
  }
}
