//allows me to have as many or as few flkes as i want
ArrayList flakes;
int currentTime;

void setup() {
  size(1080, 700);
  //instantiate the new array list
  flakes = new ArrayList();
  
  frameRate(30);
  background(255);
}

void draw(){
  currentTime++;
  fill(255);
  rect(0,0,width,height);
  
  createFlake();
  updateFlakes();
  cleanupFlake();
  
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

void updateFlakes(){
  for(int i=0; i<flakes.size(); i++){
    Circle flake = (Circle) flakes.get(i);
    flake.update();  
  }//closes for
}//closes updateFlakes

void cleanupFlake(){
   for(int i=0; i<flakes.size(); i++){
    Circle flake = (Circle) flakes.get(i);
    if(flake.y>height){
      println("offscreen");
      flakes.remove(i);
    }//closes if
  }//closes for
}//closes cleanupFlake
