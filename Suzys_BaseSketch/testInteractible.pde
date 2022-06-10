class TestInteractible implements Interactible { 
  //Enter your code that should happen when the START button is clicked
  void startPressed(boolean isOn) {
    if(isOn){
      started = true;
      imageNum = 1;
      
    } else {
      started = false;
      imageNum = 0;
      socialScore.reset();
      timer.reset();
      finished = false;
      caseValue = 0;
      caseTimer = 0;
    }
    println("[TEST] Started:" + isOn);
  }

  //Enter your code that should happen when the YES button is clicked
  void yesPressed() {
    println("[TEST] YES");
    if (started) {
      socialScore.update(true);
      imageNum++;
    }
  }

  //Enter your code that should happen when the NO button is clicked
  void noPressed() {
    println("[TEST] NO");
    if(started){
      socialScore.update(false);
      imageNum++;
    }
  }
}
