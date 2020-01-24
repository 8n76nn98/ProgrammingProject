int i=0;

int xPosition = -150;
int xPosition2 = 700;//this figure must >600

int squareWidth = 150;
int squareHeight = 150;

void setup(){
  
  size(600, 600);
  noStroke(); 
  fill(255, 19, 123);

}

void draw(){
 
  frameRate(200);
  background(255);

  //Creates first rectangle
  fill(#6acfb1);
  rect(xPosition, 100, squareWidth, squareHeight);
  
  //Creates first rectangle for wrap-around
  if(xPosition>=450){
   rect(xPosition-600, 100, squareWidth, squareHeight);
  }
  
  //Resets xPosition when rectangle reaches border
  if(xPosition++>=599){
    xPosition = 0;
  }
  
  fill(#FF3030);
  rect(xPosition2, 400, squareWidth, squareHeight);
  
  //wrap up 
  if(xPosition2<=150)
  {
    rect(xPosition2+600, 400, squareWidth, squareHeight);
  }
  //reset
  if(xPosition2--<=50)
  {
    xPosition2=600;
  }
}
