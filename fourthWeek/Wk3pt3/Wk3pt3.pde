/* Declare an array of Aliens */
import processing.sound.*;

Alien[] alienArray;
ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
Bullet theBullet;
int xPos = 1;
int yPos = 1;
boolean drawBullet;
void setup()
{
  /* create a new alien array */
  alienArray = new Alien[10];
   drawBullet =false;
  /* load the images */
  playerImage = loadImage("/Users/mingshi/Desktop/processingHomwwork/fourthWeek/Wk3pt3/tank.jpeg");
  thePlayer = new Player(playerImage);
  bulletImage = loadImage("/Users/mingshi/Desktop/processingHomwwork/fourthWeek/Wk3pt3/bullet.gif");
  
  alienImage = loadImage("/Users/mingshi/Desktop/processingHomwwork/thirdWeek/Wk3pt3/alien.GIF");
  explodeImage = loadImage("/Users/mingshi/Desktop/processingHomwwork/fourthWeek/Wk3pt3/exploding.GIF");
  size(1280, 720);
  init_sounds();
  frameRate(500);
  /* initialise the array */
  init_aliens(alienArray, alienImage);
}

void init_sounds(){
  shootSound = new SoundFile(this, "/Users/mingshi/Desktop/processingHomwwork/fourthWeek/Wk3pt3/pew.mp3");
  dieSound = new SoundFile(this, "/Users/mingshi/Desktop/processingHomwwork/fourthWeek/Wk3pt3/diesound.mp3");
  hitSound = new SoundFile(this, "/Users/mingshi/Desktop/processingHomwwork/fourthWeek/Wk3pt3/punch.mp3");
}

void init_aliens (Alien[] alienArray, PImage alienImage)
{
   /* for each position in the array,  create a new alien at an appropriate
   starting point on the screen */
   for(int i=0; i<alienArray.length; i++)
   {
     alienArray[i] = new Alien((2*i*alienImage.width), yPos, alienImage);
   }
}

void draw()
{
  /* clear the screen */
  background(255);
  thePlayer.move(mouseX);
  thePlayer.draw();
  bulletsUpdate();
  /*
  if(drawBullet == true)
    {
      theBullet.draw();
      theBullet.move();
      theBullet.collide(alienArray);
    }
    */
  /* for each alien in the array - move the alien, then draw the alien */
  for(int i=0; i<alienArray.length; i++)
  {
    alienArray[i].move();
    if(i<2)
    {
      alienArray[i].moveSinPath();
      
    }
  //  alienArray[i].explode();
    alienArray[i].draw();
    alienArray[i].collisionPowerUp(thePlayer.xpos, thePlayer.ypos, thePlayer);
    if((i%2==0)&& !alienArray[i].bonus && alienArray[i].die==false)
    {
      println("currentIndex is "+i);
      alienArray[i].powerUp();
    }
  }
}
void mousePressed()
{
  shootSound.play();
  
  if(thePlayer.bulletMode == 1)
  {
    bulletList.add(new Bullet(thePlayer.xpos-40, thePlayer.ypos,1));
    bulletList.add(new Bullet(thePlayer.xpos+40, thePlayer.ypos,1));
  }
  else if(thePlayer.bulletMode == 2)
  {
    bulletList.add(new Bullet(thePlayer.xpos-40, thePlayer.ypos,2));
    bulletList.add(new Bullet(thePlayer.xpos+40, thePlayer.ypos,2));
    bulletList.add(new Bullet(thePlayer.xpos, thePlayer.ypos,2));
  }
  else
  {
    bulletList.add(new Bullet(thePlayer.xpos, thePlayer.ypos,0));
  }
  
//  theBullet = new Bullet(bulletImage, thePlayer.xpos+, thePlayer.ypos);


  //bulletList.add(new Bullet( thePlayer.xpos-40, thePlayer.ypos));
  //bulletList.add(new Bullet(thePlayer.xpos+40, thePlayer.ypos));
  drawBullet = true;
}

void bulletsUpdate(){
  for(int i=0; i<bulletList.size(); i++){
    if(drawBullet ==true)
    {
      bulletList.get(i).move();
      bulletList.get(i).draw();
      bulletList.get(i).collide(alienArray);
    }
    if(bulletList.get(i).y() + bulletImage.height < 0){
      bulletList.remove(i);
    }
  }
}
