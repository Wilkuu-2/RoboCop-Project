import processing.serial.*;
Arduino arduino;
Anwser anwser; 
Question[] questions;
int imageNum = 0;
boolean started = false;
boolean answer;
boolean finished = false;
boolean currentstate = false;
int MAX_IMAGENUM = 39;
int caseValue = 0;
int caseTimer;
SocialScore socialScore;
Timer timer;

void setup() { 
  background(255); 
  fullScreen();
  socialScore = new SocialScore(700);
  anwser = new Anwser(); 
  arduino = new Arduino(this, 0, true, 9600);
  TestInteractible a = new TestInteractible();
  arduino.interactibles.add(a);

  questions = new Question[MAX_IMAGENUM];
  for (int i = 0; i < MAX_IMAGENUM; i++) {
    questions[i] = new Question(i);
  }
  timer = new Timer();
} 


void draw() { 
  arduino.run();
  println(imageNum);
  if (imageNum < MAX_IMAGENUM-1) {
    caseValue = 0;
  } else {
    caseValue = 1;
  }
  
  if (caseTimer == 250) {
    caseValue = 2;
  }
  
  if (caseValue == 1) {
    caseTimer++;
  }

  switch (caseValue) {
    case(0):
    println("case 0");
    questions[imageNum].render();
    if (imageNum != 0) {
      timer.render(imageNum);
    }
    break;
    case(1):
    questions[MAX_IMAGENUM-1].render();
    println("case 1");
    break;
    case(2):
    background(0,255,0);
    println("case 2");
    break;
  }
}
