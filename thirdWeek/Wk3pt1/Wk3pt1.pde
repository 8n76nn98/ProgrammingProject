/* Declare an Alien */
PImage alienImage;
Alien theAlien;

int xPos = 1;
int yPos = 1;


void setup()
{
 alienImage = loadImage("/Users/mingshi/Desktop/processingHomwwork/thirdWeek/Wk3pt1/alien.GIF");
 size(600, 600);
 theAlien = new Alien(xPos, yPos, alienImage);
 frameRate(100);
}

void draw(){
  /* clear the screen */
  background(255);
  /* move the alien */
  theAlien.move();
  /* draw the alien */
  theAlien.draw();
  
}
