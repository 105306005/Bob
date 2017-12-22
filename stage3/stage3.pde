PImage title, gameover, gamewin, startNormal, startHovered;
PImage goodMedFull, goodMedTwoThird, goodMedOneThird;
PImage badMedFull, badMedTwoThird, badMedOneThird;
PImage bgA, bgB, goodHealth, badHealth;
PImage goodMedSupply, badMedSupply;
PImage supply, cutin, germ1, germ2, germ3, germ4;
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

//Enemy
Enemy[] enemies;
//float germSpeed = 2f;

//Timer
final int GAME_INIT_TIMER = 7200;
int gameTimer = GAME_INIT_TIMER;
//bonus time****************************
//final float CLOCK_BONUS_SECONDS = 15f;

Player playerA = new Player(1);
Player playerB = new Player(2);

//float playerAX, playerAY,playerBX, playerBY;
//int playerCol, playerRow;
//it should be in Player class

//A
boolean leftStateA = false;
boolean rightStateA = false;
boolean downStateA = false;
//B
boolean leftStateB = false;
boolean rightStateB = false;
boolean downStateB = false;

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
  goodHealth = loadImage("img/goodHealth.png");
  badHealth = loadImage("img/badHealth.png");
  germ1 = loadImage("img/germ1.png");
  germ2 = loadImage("img/germ2.png");
  germ3 = loadImage("img/germ3.png");
  germ4 = loadImage("img/germ4.png");
  
  
  font = createFont("font/font.ttf", 56);
  textFont(font);
}

void initGame(){  //put anything need to be inital when game start again
  
    // Initialize enemies and their position
   // enemies = new Enemy[6];
      
  for(int i = 0; i < enemies.length; i++){
    float newX = random(0, width - 90);
    float newY = 10/*90 * ( i * 4 + floor(random(4)))*/;
   // switch(i){
      //case 0: case 1:  enemies[i] = new Germ(newX, newY); //break;
     // case 2: case 3: enemies[i] = new Germ(newX, newY); break;//in row 9 - 16
     // case 4: case 5: enemies[i] = new Germ(newX, newY); break;//in row 17 - 25
   // }
  }
  
}

void draw(){
  
//case GAME_RUN: 
  //background
  image(bgA,0,0,630,7200);
  image(bgB,630,0,630,7200);
  strokeWeight(5);
  line(630,0,630,7200);
  
  // CAREFUL!
  // Because of how this translate value is calculated, the Y value of the ground level is actually 0
  //REMEMBER to translate bgA, bgB separately
 // pushMatrix();
 // translate(0, max(90* -22, 90* 1 - playerA.y));
  
  //initial medicine
   playerA.display(1);
   playerB.display(2);
   
   playerA.update(1);
   playerB.update(2);
  
  //germ
    //for(Enemy e : enemies){
     // if(e == null) continue;
     // e.display();
     // e.update();
     // e.checkCollision(playerA);
     // e.checkCollision(playerB);
  //  }
  
  
  
   //popMatrix();
   
  //life
   for(int i=playerA.health-1; i>-1 ; i--){ 
      image(goodHealth,10+50*i,10,50,50);}
   for(int i=playerB.health-1; i>-1 ; i--){ 
      image(badHealth,10+50*i+630,10,50,50);}
 

} 
    
boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh){
  return  ax + aw > bx && ax < bx + bw && ay + ah > by && ay < by + bh;
}

void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftStateB = true;
      break;
      case RIGHT:
      rightStateB = true;
      break;
    }
  }else if(key == 'a'){
    leftStateA = true;
  }else if(key == 'd'){
    rightStateA = true;} 
  
}

void keyReleased(){
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftStateB = false;
      break;
      case RIGHT:
      rightStateB = false;
      break;
    }
  }else if(key == 'a'){
    leftStateA = false;
  }else if(key == 'd'){
    rightStateA = false;} 
  
}
