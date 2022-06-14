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
  String occupation;
  String citizenNum;
  PFont font;
  PFont font2;
  boolean hasOccupation;

  IDtag() {
    sectorNum = int(random(111, 999));
    day = int(random(1, 28));
    month = int(random(1, 13));

    //change the correct date
    year = int(random(2076, 2090));

    citizenNum = "NLDR098079847398";
    font = createFont("OpenSans-Bold.ttf", 50);
    font2 = createFont("OpenSans-Bold.ttf", 70);
  }

  void update(int initSocialScore) {
    score = initSocialScore;
    if (!hasOccupation) {
      chooseOccupation = int(random(1, 2));
      if (chooseOccupation == 1) {
        chooseOccupation = int(random(1, 4));
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
        } else if (score > 450) {
          occupation = "End of Life Therapist";
        } else if (score > 400) {
          occupation = "Cult Leader";
        } else {
          occupation = "Air Purifier";
        }
        hasOccupation = true;
      }
    }
  }

  void render() {
    //pushMatrix();
    //translate(100,50);
    //fill(255);
    //textSize(20);
    //text(occupation, 100, 200);
    //popMatrix();

    pushMatrix();
    translate(211, 125);
    //fill(255,30);
    //rect(0, 0, 1200, 390);
    fill(255);
    textFont(font);
    textAlign(LEFT);
    text(occupation, 620, 205);
    text(sectorNum, 1080, 144);
    text(day + "/" + month + "/" + year, 640, 269);
    text(citizenNum, 540, 90);
    popMatrix();

    pushMatrix();
    translate(1438, 145);
    //fill(255, 30);
    //rect(0, 0, 410, 260);
    fill(255);
    textFont(font2);
    textAlign(CENTER);
    text(score, 205, 175);
    popMatrix();
  }
}
