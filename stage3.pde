PImage title, gameover, gamewin, startNormal, startHovered;
PImage goodMedFull, goodMedTwoThird, goodMedOneThird;
PImage badMedFull, badMedTwoThird, badMedOneThird;
PImage bgA, bgB, goodHealth, badHealth, lifeA, lifeB;
PImage supply, cutin, germ;
//PImage[][] soils, stones;
PFont font;

final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2, GAME_WIN = 3;
int gameState = 1;

final int LEG_COL_COUNT = 7;
final int LEG_ROW_COUNT = 90;
final int LEG_SIZE = 90;

//int[][] soilHealth;

final int START_BUTTON_WIDTH = 144;
final int START_BUTTON_HEIGHT = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

float[] supplyX, supplyY, germX, germY;
float germSpeed = 2f;

final int GAME_INIT_TIMER = 7200;
int gameTimer = GAME_INIT_TIMER;

//final float CLOCK_BONUS_SECONDS = 15f;
PlayerA playerA = new PlayerA();

float playerAX, playerAY,playerBX, playerBY;
//int playerCol, playerRow;
final float PLAYER_B_INIT_X = 895;
final float PLAYER_B_INIT_Y = 0;

boolean leftState = false;
boolean rightState = false;
boolean downState = false;
int playerBHealth = 3;
int playerMoveDirection = 0;
int playerMoveTimer = 0;
int playerMoveDuration = 15;

boolean demoMode = false;

void setup() {
  size(1260, 810, P2D);
  frameRate(60);
  bgA = loadImage("img/bgA.png");
  bgB = loadImage("img/bgB.png");
  title = loadImage("img/title.jpg");
  gameover = loadImage("img/gameover.jpg");
  gamewin = loadImage("img/gamewin.jpg");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  goodMedFull = loadImage("img/goodMedFull.png");
  badMedFull = loadImage("img/badMedFull.png");
  lifeA = loadImage("img/lifeA.png");
  lifeB = loadImage("img/lifeB.png");
  
  font = createFont("font/font.ttf", 56);
  textFont(font);
}

void draw(){
  //background
  image(bgA,0,0,630,7200);
  image(bgB,630,0,630,7200);
  strokeWeight(5);
  line(630,0,630,7200);
  
  //initial medicine
  //image(goodMedFull,PLAYER_A_INIT_X,PLAYER_A_INIT_Y,100,100);
  image(badMedFull,PLAYER_B_INIT_X,PLAYER_B_INIT_Y,100,100);
  playerA.update();
  
  //life
   if(playerAHealth>3){
      playerAHealth=3; 
   }
   for(int i=playerAHealth-1; i>-1 ; i--){ 
      image(goodHealth,10+70*i,10);   
   }
   if(playerBHealth>3){
      playerBHealth=3; 
   }
   for(int i=playerBHealth-1; i>-1 ; i--){ 
      image(badHealth,10+70*i+630,10);   
   }
 

  
} 
  
  
  
  
  
boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh){
  return  ax + aw > bx &&    // a right edge past b left
        ax < bx + bw &&    // a left edge past b right
        ay + ah > by &&    // a top edge past b bottom
        ay < by + bh;
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
      case DOWN:
      downState = true;
      break;
    }
  }else if(key == 'r'){
    gameState = GAME_OVER;
  }
}

void keyReleased(){
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftState = false;
      break;
      case RIGHT:
      rightState = false;
      break;
      case DOWN:
      downState = false;
      break;
    }
  }






}