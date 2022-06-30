

class Timer implements Displayable{
  static final float barHeight = 50;
  long startMillis; 
  long stopMillis; 
  long durationMillis;
  
  
  Timer(long duration){
    startMillis = millis();
    stopMillis  = startMillis + duration;
    durationMillis = duration;
  }
  
  boolean isUp(){
    return millis() > stopMillis;
  }
  float getFractionalProgress(){
    return (float)(((double) getProgress()) / (double) durationMillis); 
  }
  long getProgress(){
    return millis() - startMillis; 
  }
  
  void display(){
    float cornerY = size.y - barHeight; 
    var fraction = getFractionalProgress();
    fill(0,0,0);
    rect(0,                     cornerY,
         size.x * (1-fraction), barHeight);
    fill(255,255,255);
    rect(size.x * (1-fraction), cornerY,
         size.x * (fraction)  , barHeight);
  }

}
