class Bullet {
  
  color bulletColor = color(255, 0, 127);
  int bulletXpos;
  int bulletYpos;
   int mode ;
  int doubleEndChecker; 
  
   Bullet(int x, int y,int currentMode){
   
   
   bulletXpos = x + (playerImage.width/2);
   bulletYpos = y;
   mode = currentMode;
   
 }
 int x()
 {
   return bulletXpos;
   
 }
 int y()
 {
   return bulletYpos;
 }
 
 void draw()
 {
   //image(bulletImage, bulletXpos, bulletYpos);
     strokeWeight(3); 
    
     if(mode ==0)
     {
       fill(bulletColor);
       rect(bulletXpos, bulletYpos, BULLETWIDTH, BULLETHEIGHT);
     }
     else if(mode ==1)
     {
       color bulletColor = color(#21D8CB);
       fill(bulletColor);
       ellipse(bulletXpos, bulletYpos,BULLETWIDTH, BULLETHEIGHT);
     }
       else if(mode ==2)
     {
       color bulletColor = color(#D89221);
       fill(bulletColor);
       triangle(bulletXpos+20,bulletYpos-20,bulletXpos,bulletYpos,bulletXpos+10,bulletYpos);
    
     }
    
    // rect(bulletXpos, bulletYpos, BULLETWIDTH, BULLETHEIGHT);
 }
 
 void collide(Alien[] alienArray)
 {
   for(int i = 0; i<alienArray.length; i++)
   {
     Alien testAlien = alienArray[i];
     if(bulletYpos <= testAlien.y+alienImage.height && (bulletYpos + (bulletImage.height/8)) > testAlien.y && bulletXpos >=testAlien.x && bulletXpos <= testAlien.x + alienImage.width)
     {
       testAlien.explode();
       hitSound.play();
       println("shooting !");
     }
   }
   //hitSound.play();
 }
 void move()
 {
   if(bulletYpos >= 0-bulletImage.height && bulletYpos < 720 - bulletImage.height/2)
   {
     bulletYpos-=2;
   }
   
   else
   {
     drawBullet = false;
   }
 }
 
}
