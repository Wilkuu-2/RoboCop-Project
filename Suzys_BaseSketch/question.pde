class Question {
  PImage img;

  Question(int initImgNum) {
    img = loadImage(initImgNum + ".png");
  }
  

  void render() {
    image(img,0,0);
    //textFont(font);
    //fill(255);
    //textAlign(CENTER);
    //text(questionAsked, width/2, height/2-30);
  }
} 
