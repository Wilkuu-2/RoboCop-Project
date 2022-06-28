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
  int sentenceValue;

  String occupation;
  String citizenNum;
  String information;
  PFont font;
  PFont font2;
  PFont font3;
  boolean hasOccupation;

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

    //general info randomizing
    sentenceValue = 0;
  }

  void update(int initSocialScore) {
    score = initSocialScore;

    if (score < 110) {
      score = 110;
    }

    if (score > 999) {
      score = 993;
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

      citizenNumOne = int(random(198070, 998070));
      citizenNumTwo = int(random(184739, 984739));
      citizenNum = "EARTH" + citizenNumOne + citizenNumTwo;
    }
  }

  void render() {
    pushMatrix();
    translate(90, 70);

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
    fill(255);
    textFont(font3);
    textAlign(CENTER);
    textLeading(50);
    text(information, 40, 0, 786, 256);
    popMatrix();

    pushMatrix();
    translate(1504, 116);
    line(190, 0, 190, 193);
    fill(255);
    textFont(font2);
    textAlign(CENTER);
    text(score + "/1000", 190, 145);
    popMatrix();
  }

  void generalInfoUpdate(boolean answer) {
    switch(imgListValue) {
      case(0):
      if (imageNum == 2) {
        if (!answer) {
          sentenceValue++;
        }
      }

      if (imageNum == 8) {
        if (answer) {
          if (sentenceValue != 0) {
            sentenceValue += 2;
          } else {
            sentenceValue = 2;
          }
        }
      }

      if (sentenceValue != 0) {
        int store = int(random(1, 4));
        if (store == 1) {
          infoValue = int(random(0, 2));
        } else {
          if (sentenceValue == 3) {
            infoValue = int(random(2, 4));
          } else {
            if (sentenceValue == 1) {
              infoValue = 2;
            } else {
              infoValue = 3;
            }
          }
        }
      } else {
        infoValue = int(random(0, 2));
      }
      break;

      case(1):
      if (imageNum == 3) {
        if (answer) {
          sentenceValue++;
        }
      }

      if (imageNum == 10) {
        if (answer) {
          if (sentenceValue != 0) {
            sentenceValue += 2;
          } else {
            sentenceValue = 2;
          }
        }
      }

      if (sentenceValue != 0) {
        int store = int(random(1, 4));
        if (store == 1) {
          infoValue = int(random(4, 6));
        } else {
          if (sentenceValue == 3) {
            infoValue = int(random(6, 8));
          } else {
            if (sentenceValue == 1) {
              infoValue = 6;
            } else {
              infoValue = 7;
            }
          }
        }
      } else {
        infoValue = int(random(4, 6));
      }
      break;

      case(2):
      if (imageNum == 7) {
        if (answer) {
          sentenceValue++;
        }
      }

      if (imageNum == 9) {
        if (!answer) {
          if (sentenceValue != 0) {
            sentenceValue += 2;
          } else {
            sentenceValue = 2;
          }
        }
      }

      if (sentenceValue != 0) {
        int store = int(random(1, 4));
        if (store == 1) {
          infoValue = int(random(8, 10));
        } else {
          if (sentenceValue == 3) {
            infoValue = int(random(10, 12));
          } else {
            if (sentenceValue == 1) {
              infoValue = 10;
            } else {
              infoValue = 11;
            }
          }
        }
      } else {
        infoValue = int(random(8, 10));
      }
      break;

      case(3):
      if (imageNum == 1) {
        if (answer) {
          sentenceValue++;
        }
      }

      if (imageNum == 3) {
        if (!answer) {
          if (sentenceValue != 0) {
            sentenceValue += 2;
          } else {
            sentenceValue = 2;
          }
        }
      }

      if (sentenceValue != 0) {
        int store = int(random(1, 4));
        if (store == 1) {
          infoValue = int(random(12, 14));
        } else {
          if (sentenceValue == 3) {
            infoValue = int(random(14, 16));
          } else {
            if (sentenceValue == 1) {
              infoValue = 14;
            } else {
              infoValue = 15;
            }
          }
        }
      } else {
        infoValue = int(random(12, 14));
      }
      break;
    }

    switch (infoValue) {
      ////////// image list 1
      case(0):
      information = "This human enjoys the simplicity of the past and indulges in stuff from the 2020s. They suffer from imposter syndrome but still strive to succeed in life.";
      break;

      case(1):
      information = "This well educated citizen represents the finer side of humanity, giving a kind reminder of all the good in the world.";
      break;

      // question 2 no
      case(2):
      information = "We welcome this non-human with open arms, in compliance with the intergalactic peace treaty. Indebted to SpaceX.";
      break;

      // question 8 yes
      case(3):
      information = "This person is empathetic and wants to help people learn from their mistakes.";
      break;

      ////////// image list 2
      case(4):
      information = "This person does the best they can do with what they have and strive to achieve their goals.";
      break;

      case(5):
      information = "This model citizen does their best to max out their social score and reap its benefits for the greater good.";
      break;

      // question 3 yes
      case(6):
      information = "This human is exceptional, because they appreciate the finer things in life... pineapple pizza. I'm lovin' it.";
      break;

      // question 10 yes
      case(7):
      information = "This human is fearless and knows how to pick their battles... most of the time.";
      break;

      ////////// image list 3
      case(8):
      information = "This citizen would like to make a change in the world, whether big or small, and inspire others to do the same.";
      break;

      case(9):
      information = "This adventurous human likes to indulge in the creative expressions of art and technology, enjoying the crafts made by humans and nature.";
      break;

      // question 7 if yes
      case(10):
      information = "This person is empathetic and wants to help people learn from their mistakes.";
      break;

      // question 9 if no
      case(11):
      information = "This person always tries to see the bright side of things, and strives towards excellence.";
      break;

      ////////// image list 4
      case(12):
      information = "This kind person enjoys serene environments and exploring the wacky things in life. They like to indulge in earthly desires.";
      break;

      case(13):
      information = "This charming person radiates joy and is humble, working as an example citizen for the 22nd century.";
      break;

      // question 1 if yes
      case(14):
      information = "This human is exceptional, because they appreciate the finer things in life... pineapple pizza. I'm lovin' it.";
      break;

      // question 3 if no
      case(15):
      information = "We welcome this non-human with open arms, in compliance with the intergalactic peace treaty. Indebted to SpaceX.";
      break;
    }
  }
}
