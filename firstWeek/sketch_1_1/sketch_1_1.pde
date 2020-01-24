//exercise 1
int i,j,k;
int squareHeight =80;
int squareWeight = 80;
void setup()
{
  size(400,400);
  noStroke();
  fill(255,204,0);
  i=100;//changing x -axis of first rectangle
  j = 40;//changing x-axis of second rectangle
  k =80; // chaning y-axis of third rectangle

}
void draw()
{
    background(255);
  // <- left
  fill(#6acfb1);
  rect(i--,100,squareHeight,squareWeight);
  //-> right
  fill(#FF3030);
  rect(j++,60,squareHeight,squareWeight);
  // down
  fill(#EE00EE);
  rect(20,k++,squareHeight,squareWeight);
}
