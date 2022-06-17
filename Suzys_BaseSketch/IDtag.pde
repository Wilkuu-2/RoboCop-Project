/*
 ID-TAG TAB
 In this tab the text displayed over the final IDtag video will be generated and displayed.
 */

class IDtag {
  int score;
  int chooseOccupation;
  int sectorNum;
  int day;
  int month;
  int year;
  int citizenNumOne;
  int citizenNumTwo;
  int infoValue;
  int randomValue;
  String occupation;
  String citizenNum;
  String information;
  PFont font;
  PFont font2;
  PFont font3;
  boolean hasOccupation;
  boolean isDutch;

  IDtag() {
    //for the info at the top
    sectorNum = int(random(111, 999));
    day = int(random(1, 28));
    month = int(random(1, 13));
    year = int(random(2076, 2090));

    //initialize fonts
    font = createFont("OpenSans-Bold.ttf", 50);
    font2 = createFont("OpenSans-Bold.ttf", 65);
    font3 = createFont("OpenSans-Regular.ttf", 40);

    //general info switching
    infoValue = 0;
  }

  void update(int initSocialScore) {
    score = initSocialScore;

    if (score < 110) {
      score = 110;
    }

    if (!hasOccupation) {
      chooseOccupation = int(random(0, 3));
      if (chooseOccupation == 1) {
        chooseOccupation = int(random(0, 5));
        if (chooseOccupation == 1) {
          occupation = "Dream Supplier";
        } else if (chooseOccupation == 2) {
          occupation = "Productivity Officer";
        } else if (chooseOccupation == 3) {
          occupation = "Media Remixer";
        } else if (chooseOccupation == 4) {
          occupation = "Nostalgist";
        }
        hasOccupation = true;
      } else {
        if (score > 890) {
          occupation = "Supreme Leader";
        } else if (score > 850) {
          occupation = "RobotVet";
        } else if (score > 700) {
          occupation = "Telesurgeon";
        } else if (score > 550) {
          occupation = "Drone Mechanist";
        } else if (score > 400) {
          occupation = "End of Life Therapist";
        } else if (score > 300) {
          occupation = "Cult Leader";
        } else {
          occupation = "Air Purifier";
        }
        hasOccupation = true;
      }

      if (isDutch) {
        citizenNumOne = int(random(19807, 99807));
        citizenNumTwo = int(random(1847398, 9847398));
        citizenNum = "NLDR" + citizenNumOne + citizenNumTwo;
      } else {
        citizenNumOne = int(random(198070, 998070));
        citizenNumTwo = int(random(18473980, 98473980));
        citizenNum = "EU" + citizenNumOne + citizenNumTwo;
      }
    }
  }

  void render() {
    pushMatrix();
    translate(90, 70);

    //fill(255, 30);
    //rect(0, 0, 1440, 800);
    //fill(255, 0, 0, 60);
    //rect(18, 150, 483, 640);
    fill(255);
    textFont(font);
    textAlign(LEFT);
    text(occupation, 860, 220);
    text(sectorNum, 1240, 150);
    text(day + "/" + month + "/" + year, 885, 290);
    text(citizenNum, 790, 90);
    popMatrix();

    pushMatrix();
    translate(660, 610);
    //fill(255, 70);
    //rect(0, 0, 866, 256);
    fill(255);
    textFont(font3);
    textAlign(CENTER);
    textLeading(50);
    text(information, 40, 0, 786, 256);
    popMatrix();

    pushMatrix();
    translate(1504, 116);
    //fill(255, 30);
    //rect(0, 0, 380, 193);
    line(190, 0, 190, 193);
    fill(255);
    textFont(font2);
    textAlign(CENTER);
    text(score + "/1000", 190, 145);
    popMatrix();
  }

  void citizenNumUpdate(boolean answer) {
    if (imageNum == 4) {
      if (answer) {
        isDutch = true;
      } else {
        isDutch = false;
      }
    }
  }

  void generalInfoUpdate(boolean answer) {
    if (imageNum == 2) {
      if (answer) {
        //is not human
        infoValue = 1;
      }
    }

    if (imageNum == 13) {
      if (answer) {
        //likes pineapple
        infoValue = 2;
      }
    }

    if (imageNum == 19) {
      if (answer) {
        //is brave
        if (infoValue == 0) {
          infoValue = 3;
        } else if (infoValue == 2) {
          randomValue = int(random(0, 3));
          if (randomValue == 1) {
            infoValue = 2;
          } else {
            infoValue = 3;
          }
        }
      }
    }

    switch (infoValue) {
      case (0):
      information = "This human enjoys the simplicity of the past and indulges in stuff from the 2020s. They suffer from imposter syndrome but still strive to succeed in life.";
      break;

      case(1):
      information = "We welcome this non-human with open arms, in compliance with the intergalactic peace treaty. Indebted to SpaceX.";
      break;

      case(2):
      information = "This human is exceptional, because they appreciate the finer things in life... pineapple pizza. I'm lovin' it.";
      break;

      case(3):
      information = "This human is fearless and knows how to pick their battles... most of the time.";
      break;
    }
  }
}
