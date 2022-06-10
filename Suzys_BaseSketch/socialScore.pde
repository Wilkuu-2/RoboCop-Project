class SocialScore {
  int score;
  int resetScore;
  boolean universityDegree;

  SocialScore(int initStartScore) {
    resetScore = initStartScore;
    score = initStartScore;
  }

  void update(boolean answer) {
    if (imageNum == 7) {
      if (answer) {
        score+= random(10, 20);
      } else {
        score -= random(10, 20);
      }
    }
    if (imageNum == 8) {
      if (answer) {
        universityDegree = true;
        score += random(50, 60);
      } else {
        universityDegree = false;
        score -= random(50, 60);
      }
    }
    if (imageNum == 9) {
      if (answer) {
        if (universityDegree) {
          score += random(60, 70);
        } else {
          score -= random(60, 70);
        }
      }
    }
    if (imageNum == 10) {
      if (answer) {
        score -= random(20, 50);
      } else {
        score += 20;
      }
    }
    if (imageNum == 11) {
      if (answer) {
        score += random(30, 40);
      } else {
        score -= random(30, 40);
      }
    }
    if (imageNum == 12) {
      if (answer) {
        score -= 200;
      } else {
        score += random(5, 15);
      }
    }
    if (imageNum == 13) {
      if (answer) {
        score -= random(90, 100);
      } else {
        score += random(90, 100);
      }
    }
    if (imageNum == 14) {
      if (answer) {
        score += random(50, 60);
      } else {
        score -= random(50, 60);
      }
    }
    if (imageNum == 15) {
      if (answer) {
        score += random(5, 15);
      } else {
        score -= 250;
      }
    }
    if (imageNum == 16) {
      if (answer) {
        score -= random(70, 80);
      } else {
        score += random(70, 80);
      }
    }
    if (imageNum == 17) {
      if (answer) {
        score += random(15, 25);
      } else {
        score -= random(15, 25);
      }
    }
  }

  void reset() {
    score = resetScore;
  }
}
