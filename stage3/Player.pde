class Player{

  float x, y;
  float w = 90, h = 90;
  int col, row;
  final float PLAYER_A_INIT_X = 270;
  final float PLAYER_B_INIT_X = 900;
  final float PLAYER_INIT_Y = 0; //INIT_Y are the same
  final float DOWN_SPEED = 2;
  final float RIGHT_LEFT_SPEED = 5;
  
  int health = 3;
  final int PLAYER_MAX_HEALTH = 3;

  //int moveDirection = 0;
  int moveTimer = 0;
  int moveDuration = 15;
  
  Player(int i){ //cause can't think of how to use String
    health = 3;
    if(i==1){ x = PLAYER_A_INIT_X;}
    if(i==2){ x = PLAYER_B_INIT_X;}
    y = PLAYER_INIT_Y;
    col = (int) x / 90;
    row = (int) y / 90;
    moveTimer = 0;
  }
  
  void display(int i){ 
    if(i==1){
    image(goodMedFull,x,y,90,90);}
    if(i==2){
    image(badMedFull,x,y,90,90);}  
  }
   
  void update(int i){  //too difficult so still thinking
  if(i==1){  //A
    if(x<0){ x=0;}// Check left boundary
    if(x>540){ x=540;}// Check right boundary
    if(leftStateA){
         x-=RIGHT_LEFT_SPEED;
    }else if(rightStateA){
         x+=RIGHT_LEFT_SPEED;}
    }     
  if(i==2){  //B
    if(x<630){ x=630;}// Check left boundary
    if(x>1170){ x=1170;}// Check right boundary
    if(leftStateB){
           x-=RIGHT_LEFT_SPEED;
     }else if(rightStateB){
           x+=RIGHT_LEFT_SPEED;}
   }    
      y+=DOWN_SPEED;
  
  }
  
  void hurt(int i){  //cause can't think of how to use String
    health --;
    
    if(health == 0){  //the other player win
      gameState = GAME_OVER;
      
    }else{   //return to the begin and reset some value
      if(i==1){ x = PLAYER_A_INIT_X;}
      if(i==2){ x = PLAYER_B_INIT_X;}
      y = PLAYER_INIT_Y;
      col = (int) x / 90;
      row = (int) y / 90;
      //soils[col][row + 1].health = 15;
      moveTimer = 0;
    }
  }
  

}
  
