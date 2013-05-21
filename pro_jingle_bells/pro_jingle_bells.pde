//allows me to have as many or as few flakes as i want
ArrayList flakes;
int currentTime;
int redscore = 0;
int bluescore = 0;
PFont f;
int goal = 10;
String gamestate = "play";
float mousepos = 0;
int pos = 0;


//declare sq
Square sq;

void setup() {
  size(1080, 700);
  sq = new Square();
  //instantiate the new array list
  flakes = new ArrayList();
  frameRate(30);
  background(255);
  f = createFont("Open Sans Semibold",16,true);
}

void draw(){
  currentTime++;


  fill(100, 100, 100);
  rect(0,0,width,height);
  //text(redscore, 10, 60);
  //text(bluescore, 70,60);
  textFont(f,26);
  fill(255,255,255);
  text("Goal = 10 items", 430, 100);
  text("Snowflake",30,100);
  text("Coal",980,100);
  text(redscore,30,140);
  text(bluescore,980,140);
  
  
  createFlake();
  updateFlakes();
  //sq.update();
  cleanupFlake();
  timeout();
  winner();

  
}

void winner(){
  if(bluescore == goal){
    endgame();
    text("Coal Won!!!",500,350); 
  }else if(redscore == goal){
    endgame();
    text("Snowflake Won!!!",500,350);
  }
}

void timeout(){
   //timeout function
  if(currentTime%30==0){
    if(mousepos==mouseX){
    pos++;
  }else{
      pos=0;
    }
    if(pos>20){println("gameover");
    gamestate = "over";
    noLoop();
    background(0);
    fill(255);
    text("Paused - Touch to replay",500,400);
  }
    mousepos = mouseX; 
  }
}

void createFlake(){
  if(currentTime%30==0){
    float r = int(Math.round(random(1)));
    if(r==0){
      flakes.add(new Circle("good"));
    }else{
      flakes.add(new Circle("bad"));
    }
  println(flakes.size());
    }//closes if
}//closes createFlake

void mousePressed(){
  if(gamestate == "over"){
  restart();
  }
}

void updateFlakes(){
    for(int i=0; i<flakes.size(); i++){
      Circle flake = (Circle) flakes.get(i);
      float d = dist(mouseX,mouseY,flake.x,flake.y);
        if(d<5+flake.size && mousePressed == true){
          if(flake.type=="good"){
          //hit++;
          flakes.remove(i);
          redscore = redscore+1;
          println("remove good");
          }
          else if(flake.type=="bad"){
          //hit++;
          flakes.remove(i);
          bluescore = bluescore+1;
          println("remove bad");
          }/*else if(d>5+flake.size && mousePressed == true){
          miss++;
          }*/
        }
        flake.update();
    }//closes for
}//closes updateFlakes

void cleanupFlake(){
   for(int i=0; i<flakes.size(); i++){
    Circle flake = (Circle) flakes.get(i);
    if(flake.y>height+(flake.size/2)){
      println("offscreen");
      flakes.remove(i);
    }//closes if
  }//closes for
}//closes cleanupFlake

void endgame(){
    gamestate = "over";
    noLoop();
    background(0);
    fill(255);
    text("Touch to replay",500,400);
}

void restart(){
  gamestate = "play";
  bluescore = 0;
  redscore = 0;

  while(flakes.size()>0){
    flakes.remove(0);
  }
  loop();
}
