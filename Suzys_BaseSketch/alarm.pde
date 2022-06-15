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
        case(0):
        image(alarmMovie, 0, 0);
        timerCountdown();
        break;

        case(1):
        image(alarmQuestion, 0, 0);
        break;

        case(2):
        image(cursedIDMovie, 0, 0);
        image(video,261,173,230,230);
        break;
      }
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
  }

  // 
  void timerCountdown() {
    displayZeroTimer--;
  }
}
