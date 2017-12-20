PImage face, eye, mouthShut, mouthOpen ;
PImage acne3,acne2,acne1,acne0;
PFont font;
boolean leftState,rightState,upState,downState;

Acne[] acneList;
int acneCounter;

Timer stage1Timer;

void initStage1(){
stage1Timer = new Timer(7200);
}

void setup() {  
  size(1260, 810, P2D);
  face = loadImage("img/face.png");
  eye = loadImage("img/eye.png");  
  acne0 = loadImage("img/acne0.png");
  acne1 = loadImage("img/acne1.png");
  acne2 = loadImage("img/acne1.png");
  acne3 = loadImage("img/acne3.png");
  
  mouthShut = loadImage("img/mouthShut.png");
  mouthOpen = loadImage("img/mouthOpen.png");
  
  font = createFont("font/font.ttf", 56);
  textFont(font);
  
  acneList = new Acne[70];
  acneCounter = 0;
  
  initStage1();
  }


//Draw eyes functions
float  radianTowardsMouse(float x,float y){
  float eyeRad = atan2(mouseY-y, mouseX-x);
  return eyeRad;

}

void drawEye(float x, float y){ 
  pushMatrix();
  translate(x, y);
  rotate(radianTowardsMouse(x,y));
  imageMode(CENTER);
  image(eye, 0, 0, 77.7, 77.7);  
  imageMode(CORNER);
  popMatrix();
}

 
//Main Functions
void draw() {
  loadPixels();
  stage1Timer.frame --;
  drawTimerUI(stage1Timer.frame);
  
//Background
  image(face, 0, 0, 1260, 810);
  
//Eyes
  drawEye(506, 360);
  drawEye(814, 360);
  
//Acnes
  for(int i=0;i<acneCounter;i++){
    acneList[i].displayAcne(acneList[i].acneLevel,acneList[i].acneX,acneList[i].acneY);    
  }

//Mouth
  PImage mouthDisplay = mouthShut;
  imageMode(CENTER);
  image(mouthDisplay,width/2+40,height-207);
  imageMode(CORNER);

//Food

 
//Draw Timer
drawTimerUI(stage1Timer.frame);

}

void mouseClicked() { 
  int newX = (int)random(width);
  int newY = (int)random(height);
  while(isAddable(newX,newY)==false||
        isAddable(newX+36,newY)==false||
        isAddable(newX-36,newY)==false||
        isAddable(newX,newY+36)==false||
        isAddable(newX,newY-36)==false||
        //corner
        isAddable(newX+36,newY+36)==false||
        isAddable(newX-36,newY+36)==false||
        isAddable(newX+36,newY-36)==false||
        isAddable(newX-36,newY-36)==false)
         {
          newX = (int)random(width);
          newY = (int)random(height);   
  }
  acneList[acneCounter]=new Acne((int)random(0,4),newX,newY);
  acneCounter++;
}

void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftState = true;
      break;
      case RIGHT:
      rightState = true;
      break;
      case UP:
      upState = true;
      break;
      case DOWN:
      downState = true;
      break;
    }
  }
}