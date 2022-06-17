/*
 ALARM TAB
 In this tab the different alarm states and cases will be updated and displayed.
 */

class Alarm {
  PImage alarmQuestion;
  int alarmDisplay;
  int displayZeroTimer;
  int resetValue;
  int userAnswer;
  boolean oneMistake;
  boolean alarmShouldChange = false;
  boolean alarmState = false;

  Alarm(int initTimerValue) {
    alarmQuestion = loadImage("alarm.png");
    alarmDisplay = 0;
    displayZeroTimer = initTimerValue;
    resetValue = initTimerValue;
    userAnswer = 3;
    oneMistake = false;
  }

  void render(boolean timeIsUp) {
    if (timeIsUp) {
      switch (alarmDisplay) {
        // alarm
        case(0):
        image(alarmMovie, 0, 0);
        timerCountdown();
        alarmShouldChange = true;
        break;

        // question
        case(1):    
        file.stop();
        image(alarmQuestion, 0, 0);
        break;
        
        // cursed ID display
        case(2):
        alarmShouldChange = false;
        image(cursedIDMovie, 0, 0);
        break;
      }
      soundUpdate();
      update();
    }
  }

  void update() {
    if (displayZeroTimer <= 0) {
      if (!oneMistake) {
        alarmDisplay = 1;
      } else {
        alarmDisplay = 2;
      }
    } else {
      alarmDisplay = 0;
    }

    if (alarmDisplay == 1) {
      if (userAnswer == 1) {
        //yes
        caseValue = 0;
        oneMistake = true;
        reset();
      } else if (userAnswer == 2) {
        //no
        alarmDisplay = 2;
      }
    }
  }

  // reset values
  void reset() {
    displayZeroTimer = resetValue;
    userAnswer = 3;
    timer.time = 0;
    file.stop();
    file2.stop();
  }

  void timerCountdown() {
    displayZeroTimer--;
  }

  void soundUpdate() {
    if (alarmState != alarmShouldChange) {
      if (alarmShouldChange) {
        file2.stop();
        file.play();
      } else {
        file.stop();
        file2.play();
      }
    }
    alarmState = alarmShouldChange;
  }
}
