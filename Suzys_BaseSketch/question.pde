/*
 QUESTION TAB
 In this tab the different alarm states and cases will be updated and displayed.
 */

class Question {
  PImage img;
  PImage img2;
  PImage img3;
  PImage img4;

  Question(int initImgNum) {
    img = loadImage("first/" + initImgNum + ".png");
    img2 = loadImage("second/" + initImgNum + ".png");
    img3 = loadImage("third/" + initImgNum + ".png");
    img4 = loadImage("fourth/" + initImgNum + ".png");
  }

  void render(int initValue) {
    switch(initValue) {
      case(0):
      image(img, 0, 0);
      break;

      case(1):
      image(img2, 0, 0);
      break;

      case(2):
      image(img3, 0, 0);
      break;

      case(3):
      image(img4, 0, 0);
      break;
    }
  }
}
