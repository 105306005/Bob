class Player {
	
	float x, y;
	float w = 100, h = 100;
	int col, row;
  final float PLAYER_A_INIT_X = 265;
  final float PLAYER_A_INIT_Y = 0;

	int health = 3;
	final int PLAYER_MAX_HEALTH = 3;

	//int moveDirection = 0;
	int moveTimer = 0;
	int moveDuration = 15;
  
  Player(){
    health = 2;
    x = PLAYER_A_INIT_X;
    y = PLAYER_A_INIT_Y;
    col = (int) x / 100;
    row = (int) y / 100;
    moveTimer = 0;
  }
  
	void update(){

		// If player is not moving, we have to decide what player has to do next
		if(moveTimer == 0)
    {

			if((row + 1 < SOIL_ROW_COUNT && soils[col][row + 1].health == 0) || row + 1 >= SOIL_ROW_COUNT)
      {
				//groundhogDisplay = groundhogDown;
				moveDirection = DOWN;
				moveTimer = moveDuration;

			}else{

				if(leftState){
					//groundhogDisplay = groundhogLeft;

					// Check left boundary
				if(col > 0){

						if(row >= 0 && soils[col - 1][row].health > 0){
							soils[col - 1][row].health --;
						}else{
							moveDirection = LEFT;
							moveTimer = moveDuration;
						}

					}

				}else if(rightState){

					//groundhogDisplay = groundhogRight;

					// Check right boundary
					if(col < SOIL_COL_COUNT - 1){

						if(row >= 0 && soils[col + 1][row].health > 0){
							soils[col + 1][row].health --;
						}else{
							moveDirection = RIGHT;
							moveTimer = moveDuration;
						}

					}

				}else if(downState){

					//groundhogDisplay = groundhogDown;

					// Check bottom boundary
					if(row < SOIL_ROW_COUNT - 1){

						soils[col][row + 1].health --;

					}
				}
			}
    }
image(goodMedFull, x, y,100,100);

}


	}