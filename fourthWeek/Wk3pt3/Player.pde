class Player{
  
  
  PImage spacePlayerImage;
  int xpos;
  int ypos;
  int bulletMode;//for changing threee status
  float previousXPos = 0.0;
  
 Player (PImage playerImage){
   
   spacePlayerImage = playerImage;
   xpos = (1280-spacePlayerImage.width)/2;
   ypos = 720- (spacePlayerImage.height + 60);
 }
 int x()
 {
   return xpos;
 }
 int y()
 {
   return ypos;
 }
 void draw()
 {
   image(spacePlayerImage, xpos, ypos);
 }
 void move(int x)
 {
   if(x>SCREEN_X-alienImage.width)
   {
     xpos = SCREEN_X-alienImage.width;
     previousXPos = xpos;
   
   }
   else
   {
     xpos = x;
     previousXPos = xpos;
   }
 }
 

 
 
}
