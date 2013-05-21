class Square{
  float x;
  float y;
  float tall;
  float wide;
  color squareColor;
  int size;

  Square(){
    size = 10;
    squareColor = color(0,255,0);
  }
  
  //this will update the location of our square object
void update(){
  x = mouseX+(-10*.5);
  y = mouseY+(-10*.5);
  noStroke();
  fill(squareColor);
  rect(x,y,size,size);
  imageMode(CENTER);
  }
  
}


