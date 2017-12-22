class Player{

  float x, y;
  float w = 90, h = 90;
  int col, row;
  final float PLAYER_A_INIT_X = 270;
  final float PLAYER_B_INIT_X = 900;
  final float PLAYER_INIT_Y = 0; //INIT_Y are the same

  int health = 3;
  final int PLAYER_MAX_HEALTH = 3;

  //int moveDirection = 0;
  int moveTimer = 0;
  int moveDuration = 15;
  
  Player(int i){ //cause can't think of how to use string
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
    image(goodMedFull,PLAYER_A_INIT_X,PLAYER_INIT_Y,90,90);}
    if(i==2){
    image(badMedFull,PLAYER_B_INIT_X,PLAYER_INIT_Y,90,90);}  
  }
  
  void update(int i){  //too difficult so still thinking
  
  
  
  }
  
  void hurt(int i){  //cause can't think of how to use string
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
