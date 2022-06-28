/*
 EXTENDED INTERACTION TAB
 In this tab all logical statements for the butonclicks are defined
 */

class TestInteractible implements Interactible {
  //Enter your code that should happen when the START button is clicked
  void startPressed(boolean isOn) {
    if (isOn) {
      started = true;
      imageNum = 1;
    } else {
      switchImgValue();
      started = false;
      imageNum = 0;
      socialScore.reset();
      timer.reset();
      finished = false;
      caseValue = 0;
      caseTimer = 0;
      alarm.reset();
      alarm.oneMistake = false;
      idTag.hasOccupation = false;
      idTag.infoValue = 0;
      idTag.sentenceValue = 0;
      file.stop();
      file2.stop();
    }
    println("[TEST] Started:" + isOn);
  }

  //Enter your code that should happen when the YES button is clicked
  void yesPressed() {
    println("[TEST] YES");
    if (started) {
      if (caseValue == 0) {
        socialScore.update(true);
        idTag.generalInfoUpdate(true);
        imageNum++;
      } else if (caseValue == 3 && alarm.alarmDisplay == 1) {
        alarm.userAnswer = 1;
        alarm.alarmShouldChange = false;
        alarm.alarmState = false;
      }
    }
  }

  //Enter your code that should happen when the NO button is clicked
  void noPressed() {
    println("[TEST] NO");
    if (started) {
      if (caseValue == 0) {
        socialScore.update(false);
        idTag.generalInfoUpdate(false);
        imageNum++;
      } else if (caseValue == 3 && alarm.alarmDisplay == 1) {
        alarm.userAnswer = 2;
      }
    }
  }
}
