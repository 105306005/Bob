int colorOfShadow = -345211;
int colorOfEar = -411004;
int colorOfFace = -275814;
int acne1Size = 30;
int acne2Size = 50;
int acne3Size = 70;

//Some Function    
boolean isAddable(int x,int y){
  
  int location = x+(y*width); 
  
  if(location>1233630){
    return false;
  }
  
  color positionColor =pixels[location];
    if(positionColor != colorOfShadow&&
       positionColor == colorOfEar||
       positionColor == colorOfFace)
    {
      return true;
  } return false;
    
}
  
class Acne {
  int acneLevel,acneX,acneY;
  
  Acne(int lv,int acneX,int acneY){
    this.acneLevel=lv;
    this.acneX=acneX;
    this.acneY=acneY;
  }
 

  void displayAcne(int lv,int x,int y){
    imageMode(CENTER);
    
    if(lv==3){
    image(acne3,x,y,acne3Size,acne3Size);
    }else if(lv==2){
    image(acne2,x,y,acne2Size,acne2Size);
    }else if(lv==1){
    image(acne1,x,y,acne1Size,acne1Size);
    }else {
    image(acne0,x,y,acne1Size,acne1Size);
    }
    
    imageMode(CORNER);
  }
  
  
}