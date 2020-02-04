/* Declare an array of Aliens */
Alien[] alienArray;
PImage alienImage;
PImage explodeImage;
PImage disappearImage;
import ddf.minim.*;
AudioPlayer player;
AudioPlayer sound;
Minim minim;
int xPos = 1;
int yPos = 1;

void setup()
{
  /* create a new alien array */
  alienArray = new Alien[10];
  /* load the images */
  alienImage = loadImage("/Users/mingshi/Desktop/processingHomwwork/thirdWeek/extra/alien.GIF");
  explodeImage = loadImage("/Users/mingshi/Desktop/processingHomwwork/thirdWeek/extra/exploding.GIF");
  size(1280, 720);
  frameRate(700);
  /* initialise the array */
  init_aliens(alienArray, alienImage);
  minim = new Minim(this);
  
  player = minim.loadFile("/Users/mingshi/Desktop/processingHomwwork/thirdWeek/extra/Jingle-Bells.mp3", 2048);
  player.play();
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
  /* for each alien in the array - move the alien, then draw the alien */
  for(int i=0; i<alienArray.length; i++)
  {
    alienArray[i].moveRegular();
    if(i<6)
    {
       alienArray[i].explode();
    }
  
    alienArray[i].draw();
  }

}
