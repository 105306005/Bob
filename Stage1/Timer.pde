final int GAME_INIT_TIMER = 3600;

void drawTimerUI(int gameTimer){

  String timeString = convertFramesToTimeString(gameTimer); // Requirement #4: Get the mm:ss string using String convertFramesToTimeString(int frames)

  textAlign(LEFT, BOTTOM);

  // Time Text Shadow Effect - You don't have to change this!
  fill(0, 120);
  text(timeString, 3, height + 3);

  // Actual Time Text
  color timeTextColor = getTimeTextColor(gameTimer);     // Requirement #5: Get the correct color using color getTimeTextColor(int frames)
  fill(timeTextColor);
  text(timeString, 0, height);
}

//some methods
String convertFramesToTimeString(int frames){  // Requirement #4
  int mm = (int)(frames / 3600);
  int ss = (int)((frames % 3600)/60);    
  return "0"+mm+":"+nf(ss,2);
}

color getTimeTextColor(int frames){        // Requirement #5
  if(frames>=3600){
  return #ffffff;
  }else if(frames>=1800){
  return #ffcc00;
  }else if(frames>600){
  return #ff6600;
  }else{
  return #ff0000;
  }  
}

//constructor
class Timer{
  int frame;
  
  Timer(int frame){
    this.frame=frame;
  }

}