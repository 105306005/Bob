
class Food{
  int foodType;
  int foodX;
  int foodY;
  int foodSpeedX;
  int foodSpeedY;
  
  Food(int x, int y){
    foodX=x;
    foodY=y;
  }
 
  void moveFood(){
   if(leftState){
     foodX--;
     }
   if(rightState){
     foodX++;
     }
   if(upState){
     foodY--;
     }
   if(downState){
     foodY++;
     }
     
  }
  
}