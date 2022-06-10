class Timer { 
  float time = 0;
  float mod;
  color c1, c2;
  int currentNumber;

  Timer() {
    c1 = color(250, 14, 3);
    c2 = color(30, 350, 20);
    mod = 1;
  }

  void render(int initNum) {
    //if(currentNumber == 1){
    //  mod = 1;
    //}
    if (currentNumber != initNum) {
      time = 0;
      if (mod >= 15) {
        mod = 15;
      } else if (initNum >= 5) {
        mod += 0.7;
      }
    }
    update(0, height-60, width, 60, c1, c2);

    noStroke();
    fill(0);
    rect(0, height-60, width-time, 60);
    time+=mod;
    currentNumber = initNum;
  }

  void update(int x, int y, float w, float h, color c1, color c2) {
    noFill();
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }

  void reset() {
    mod = 1;
    time = 0;
  }
}
