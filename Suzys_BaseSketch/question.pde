/*
 QUESTION TAB
 In this tab the different alarm states and cases will be updated and displayed.
 */

class Question {
  PImage img;

  Question(int initImgNum) {
    img = loadImage(initImgNum + ".png");
  }

  void render() {
    image(img, 0, 0);
  }
} 
