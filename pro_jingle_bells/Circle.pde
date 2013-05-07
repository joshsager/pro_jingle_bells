class Circle{
  float x;
  float y;
  color col;
  int speed;
  String type;
  float scalar = 4;
  PImage img = null;
  
  Circle(String t){
    println("Snowflake Created");
    //col = color(255,0,0);
    x=random(width);
    speed = int(random(5)+1);
    type = t;
  }
  
  void update(){
    
    if(type=="good"){
        //col = color(0,0,255);
        img = loadImage("snowflake.png");
    }else if(type=="bad"){
        //col = color(255,0,0);
        img = loadImage("badthing.png");
    }
    
    y+=speed;
    fill(col);
    //ellipse(x,y,20,20);
    //img = loadImage("snowflake.png");
    image(img,x,y);
  }
}
