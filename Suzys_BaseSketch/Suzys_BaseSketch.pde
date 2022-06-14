import processing.serial.*;
import processing.video.*;
Movie myMovie;
Movie alarmMovie;
Movie cursedIDMovie;
Arduino arduino;
Alarm alarm;
IDtag idTag;
Question[] questions;
SocialScore socialScore;
Timer timer;

int imageNum = 0;
int MAX_IMAGENUM = 39;
int caseValue = 0;
int caseTimer;

boolean started = false;
boolean answer;
boolean finished = false;
boolean currentstate = false;

void setup() { 
  background(255); 
  fullScreen();

  // initialize movie for ID tag
  myMovie = new Movie(this, "videoyay.mp4");
  myMovie.loop();
  
  // initialize movies for alarm
  alarmMovie = new Movie(this, "alarm.mp4");
  cursedIDMovie = new Movie(this, "cursedID.mp4");
  cursedIDMovie.loop();
  alarmMovie.loop();

  // initialize arduino and interaction  
  arduino = new Arduino(this, 0, true, 9600);
  TestInteractible a = new TestInteractible();
  arduino.interactibles.add(a);

  // intitialize objects
  alarm = new Alarm(500);
  idTag = new IDtag();
  questions = new Question[MAX_IMAGENUM];
  for (int i = 0; i < MAX_IMAGENUM; i++) {
    questions[i] = new Question(i);
  }
  socialScore = new SocialScore(700);
  timer = new Timer();
} 


void draw() { 

  // activate arduino activity
  arduino.run();
  
  // change from questionnaire to finish screen when last question has been answered
  if (imageNum < MAX_IMAGENUM-1) {
    caseValue = 0;
  } else {
    caseValue = 1;
  }

  // if end value for timer has been reached, switch from finish screen to final display
  if (caseTimer == 250) {
    caseValue = 2;
  }

  // increase timer value while finish screen is shown
  if (caseValue == 1) {
    caseTimer++;
  }

  // show alarm if timer has run out of time
  if (timer.timeUp()) {
    caseValue = 3;
  }

  switch (caseValue) {

    // question loop
    case(0):
    questions[imageNum].render();
    if (imageNum != 0) {
      timer.render(imageNum);
    }
    break;

    // finish screen
    case(1):
    questions[MAX_IMAGENUM-1].render();
    break;

    // final ID tag display
    case(2):
    resetMovieTest(myMovie, 22.5);
    background(0, 255, 0);
    image(myMovie, 0, 0);
    idTag.update(socialScore.score);
    idTag.render();
    break;

    // alarm question
    case(3):
    resetMovieTest(alarmMovie, 5.0);
    resetMovieTest(cursedIDMovie, 22.5);
    alarm.render(timer.timeUp());
    break;
  }
  // temporary
  fill(255);
  textSize(100);
  text(socialScore.score, 100, height-100);
}

// read movie frames
void movieEvent(Movie m) {
  m.read();
}

// reset movie frame to prevent video from glitching
void resetMovieTest(Movie m, float initMaxDuration) {
  if (m.time() > initMaxDuration) {
    m.jump(0);
  }
}
