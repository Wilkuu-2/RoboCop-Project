/*
 SOCIALSCORE TAB
 In this tab the value for social score will be calculated
 */

class SocialScore {
  int score;
  int resetScore;
  boolean universityDegree;

  SocialScore(int initStartScore) {
    resetScore = initStartScore;
    score = initStartScore;
  }

  void update(boolean answer) {
    switch (imgListValue) {
      case(0):
      if (imageNum == 1) {
        if (answer) {
          score+= random(5, 10);
        } else {
          score -= random(5, 10);
        }
      }
      if (imageNum == 2) {
        if (answer) {
          score+= 20;
        } else {
          score += 30;
        }
      }
      if (imageNum == 3) {
        if (answer) {
          score+= random(10, 15);
        } else {
          score -= random(10, 15);
        }
      }
      if (imageNum == 4) {
        if (answer) {
          score += random(35, 40);
        } else {
          score -= random(35, 40);
        }
      }
      if (imageNum == 5) {
        if (answer) {
          score += 5;
        } else {
          score += 10;
        }
      }
      if (imageNum == 6) {
        if (answer) {
          score += random(15, 20);
        } else {
          score -= random(15, 20);
        }
      }
      if (imageNum == 7) {
        if (answer) {
          score -= random(25, 30);
        } else {
          score += random(25, 30);
        }
      }
      if (imageNum == 8) {
        if (answer) {
          score += random(10, 15);
        } else {
          score -= random(10, 15);
        }
      }
      if (imageNum == 9) {
        if (answer) {
          score -= random(25, 30);
        } else {
          score += random(25, 30);
        }
      }
      if (imageNum == 10) {
        if (answer) {
          score -= random(50, 55);
        } else {
          score += random(70, 75);
        }
      }
      if (imageNum == 11) {
        if (answer) {
          score -= random(5, 10);
        } else {
          score += random(5, 10);
        }
      }
      if (imageNum == 12) {
        if (answer) {
          score -= random(20, 25);
        } else {
          score += random(20, 25);
        }
      }
      if (imageNum == 13) {
        if (answer) {
          score -= random(70, 75);
        } else {
          score += random(70, 75);
        }
      }
      if (imageNum == 14) {
        if (answer) {
          score += random(35, 40);
        } else {
          score -= 75;
        }
      }
      if (imageNum == 15) {
        if (answer) {
          score -= 5;
        } else {
          score += random(0,5);
        }
      }
      //score = 200;
      break;

      case(1):
      if (imageNum == 1) {
        if (answer) {
          score -= 15;
        } else {
          score += 15;
        }
      }
      if (imageNum == 2) {
        if (answer) {
          score += random(20,25);
        } else {
          score -= random(20,25);
        }
      }
      if (imageNum == 3) {
        if (answer) {
          score += random(15, 20);
        } else {
          score -= random(15, 20);
        }
      }
      if (imageNum == 4) {
        if (answer) {
          score += random(50, 55);
        } else {
          score -= random(50, 55);
        }
      }
      if (imageNum == 5) {
        if (answer) {
          score += random(20,25);
        } else {
          score -= random(20,25);
        }
      }
      if (imageNum == 6) {
        if (answer) {
          score -= random(10, 15);
        } else {
          score += 15;
        }
      }
      if (imageNum == 7) {
        if (answer) {
          score += 20;
        } else {
          score -= random(10, 15);
        }
      }
      if (imageNum == 8) {
        if (answer) {
          score += random(35, 40);
        } else {
          score -= random(35, 40);
        }
      }
      if (imageNum == 9) {
        if (answer) {
          score -= random(15, 20);
        } else {
          score += random(15, 20);
        }
      }
      if (imageNum == 10) {
        if (answer) {
          score -= random(10, 15);
        } else {
          score += random(10, 15);
        }
      }
      if (imageNum == 11) {
        if (answer) {
          score -= random(20, 25);
        } else {
          score += random(20, 25);
        }
      }
      if (imageNum == 12) {
        if (answer) {
          score -= random(5, 10);
        } else {
          score += random(5, 10);
        }
      }
      if (imageNum == 13) {
        if (answer) {
          score += random(50, 55);
        } else {
          score -= random(50, 55);
        }
      }
      if (imageNum == 14) {
        if (answer) {
          score += random(15, 20);
        } else {
          score -= random(15,20);
        }
      }
      if (imageNum == 15) {
        if (answer) {
          score += random(35,40);
        } else {
          score -= 75;
        }
      }
      //score = 300;
      break;

      case(2):
      if (imageNum == 1) {
        if (answer) {
          score+= random(10, 15);
        } else {
          score -= random(10, 15);
        }
      }
      if (imageNum == 2) {
        if (answer) {
          score+= random(5, 10);
        } else {
          score -= random(5,10);
        }
      }
      if (imageNum == 3) {
        if (answer) {
          score -= random(1, 5);
        } else {
          score += random(5, 10);
        }
      }
      if (imageNum == 4) {
        if (answer) {
          score += random(10, 15);
        } else {
          score -= random(10, 15);
        }
      }
      if (imageNum == 5) {
        if (answer) {
          score += random(35,40);
        } else {
          score -= random(35,40);
        }
      }
      if (imageNum == 6) {
        if (answer) {
          score += random(25, 30);
        } else {
          score -= random(25, 30);
        }
      }
      if (imageNum == 7) {
        if (answer) {
          score += random(10, 15);
        } else {
          score -= random(10, 15);
        }
      }
      if (imageNum == 8) {
        if (answer) {
          score -= random(25, 30);
        } else {
          score += random(25, 30);
        }
      }
      if (imageNum == 9) {
        if (answer) {
          score -= random(25, 30);
        } else {
          score += random(25, 30);
        }
      }
      if (imageNum == 10) {
        if (answer) {
          score -= random(5, 10);
        } else {
          score += random(5, 10);
        }
      }
      if (imageNum == 11) {
        if (answer) {
          score -= random(50, 55);
        } else {
          score += random(70, 75);
        }
      }
      if (imageNum == 12) {
        if (answer) {
          score -= random(45, 50);
        } else {
          score += random(45, 50);
        }
      }
      if (imageNum == 13) {
        if (answer) {
          score += random(35, 40);
        } else {
          score -= 75;
        }
      }
      if (imageNum == 14) {
        if (answer) {
          score -= 5;
        } else {
          score += random(0,5);
        }
      }
      if (imageNum == 15) {
        if (answer) {
          score += 15;
        } else {
          score -= random(1,5);
        }
      }
      //score = 400;
      break;

      case(3):
      if (imageNum == 1) {
        if (answer) {
          score+= random(15, 20);
        } else {
          score -= random(15, 20);
        }
      }
      if (imageNum == 2) {
        if (answer) {
          score+= random(35,40);
        } else {
          score -= random(35,40);
        }
      }
      if (imageNum == 3) {
        if (answer) {
          score+= 20;
        } else {
          score += 30;
        }
      }
      if (imageNum == 4) {
        if (answer) {
          score -= random(25, 30);
        } else {
          score += random(25, 30);
        }
      }
      if (imageNum == 5) {
        if (answer) {
          score += random(1, 5);
        } else {
          score -= random(1, 5);
        }
      }
      if (imageNum == 6) {
        if (answer) {
          score += random(50, 55);
        } else {
          score -= random(50, 55);
        }
      }
      if (imageNum == 7) {
        if (answer) {
          score += random(20, 25);
        } else {
          score -= random(20, 25);
        }
      }
      if (imageNum == 8) {
        if (answer) {
          score += random(15, 20);
        } else {
          score -= random(15, 20);
        }
      }
      if (imageNum == 9) {
        if (answer) {
          score += 20;
        } else {
          score -= random(10, 15);
        }
      }
      if (imageNum == 10) {
        if (answer) {
          score -= random(15, 20);
        } else {
          score += random(15, 20);
        }
      }
      if (imageNum == 11) {
        if (answer) {
          score -= random(5, 10);
        } else {
          score += random(10, 15);
        }
      }
      if (imageNum == 12) {
        if (answer) {
          score -= random(50, 55);
        } else {
          score += random(70, 75);
        }
      }
      if (imageNum == 13) {
        if (answer) {
          score += random(15, 20);
        } else {
          score -= random(15, 20);
        }
      }
      if (imageNum == 14) {
        if (answer) {
          score -= random(20, 25);
        } else {
          score += random(20,25);
        }
      }
      if (imageNum == 15) {
        if (answer) {
          score += random(35,40);
        } else {
          score -= 75;
        }
      }
      //score = 500;
      break;
    }
    //if (imageNum == 6) {
    //  if (answer) {
    //    score+= random(10, 20);
    //  } else {
    //    score -= random(10, 20);
    //  }
    //}
    //if (imageNum == 7) {
    //  if (answer) {
    //    universityDegree = true;
    //    score += random(50, 60);
    //  } else {
    //    universityDegree = false;
    //    score -= random(50, 60);
    //  }
    //}
    //if (imageNum == 9) {
    //  if (answer) {
    //    if (universityDegree) {
    //      score += random(60, 70);
    //    } else {
    //      score -= random(60, 70);
    //    }
    //  }
    //}
    //if (imageNum == 14) {
    //  if (answer) {
    //    score -= random(20, 50);
    //  } else {
    //    score += 20;
    //  }
    //}
    //if (imageNum == 16) {
    //  if (answer) {
    //    score -= random(30, 40);
    //  } else {
    //    score += random(30, 40);
    //  }
    //}
    //if (imageNum == 17) {
    //  if (answer) {
    //    score += random(5, 15);
    //  } else {
    //    score -= 200;
    //  }
    //}
    //if (imageNum == 21) {
    //  if (answer) {
    //    score -= random(90, 100);
    //  } else {
    //    score += random(90, 100);
    //  }
    //}
    //if (imageNum == 22) {
    //  if (answer) {
    //    score += random(50, 60);
    //  } else {
    //    score -= random(50, 60);
    //  }
    //}
    //if (imageNum == 24) {
    //  if (answer) {
    //    score += random(5, 15);
    //  } else {
    //    score -= 250;
    //  }
    //}
    //if (imageNum == 25) {
    //  if (answer) {
    //    score -= random(70, 80);
    //  } else {
    //    score += random(70, 80);
    //  }
    //}
    //if (imageNum == 28) {
    //  if (answer) {
    //    score += random(15, 25);
    //  } else {
    //    score -= random(15, 25);
    //  }
    //}
  }

  void reset() {
    score = resetScore;
  }
}
