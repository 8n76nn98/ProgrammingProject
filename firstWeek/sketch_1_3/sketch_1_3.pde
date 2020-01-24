//exercise 3
int i=0;

int xPosition = -150;
int xPosition2 = 600;

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
  rect(xPosition, 100, squareWidth, squareHeight);
  
  //Creates second rectangle for wrap-around smoothly 
  if(xPosition>=450){
   rect(xPosition-600, 100, squareWidth, squareHeight);
  }
  
  //Resets xPosition when rectangle reaches border
  if(xPosition++>=599){
    xPosition = 0;
  }
}
