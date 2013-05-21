class Circle {
  float x;
  float y;
  color col;
  int speed;
  String type;
  float scalar = 4;
  PImage img = null;
  int size;
  PImage bad;
  PImage good;
  

  Circle(String t) {
    println("Snowflake Created");
    col = color(255, 0, 0);
    x=random(width);
    speed = int(random(5)+1);
    type = t;
    size = 40;
    bad = loadImage("badthing.png");
    good = loadImage("snowflake.png");
  }

  void update() {

    if (type=="good") {
      col = color(255,0,0,0); 
      noStroke();
      img = good;
    }
    else if (type=="bad") {
      col = color(255,0,0,0); 
      noStroke();
      img = bad;
    }

    y+=speed;
    fill(col);
    ellipse(x, y, size, size);
    //img = loadImage("badthing.png");
    //img = loadImage("snowflake.png");
    image(img, x-48, y-48);
  }
}

