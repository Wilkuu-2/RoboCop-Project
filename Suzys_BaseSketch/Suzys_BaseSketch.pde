import processing.serial.*;
import processing.video.*;
import processing.sound.*;

Movie myMovie;
Movie alarmMovie;
Movie cursedIDMovie;
Movie startScreen;
Movie loadingScreen;
Arduino arduino;
Alarm alarm;
IDtag idTag;
Question[] questions;
SocialScore socialScore;
Timer timer;
SoundFile file;
SoundFile file2;
LoadScreen loadScreen;
Capture video;

int imageNum = 0;
int MAX_IMAGENUM = 39;
int caseValue = 0;
int caseTimer;
int caseTimerValue;

boolean started = false;
boolean answer;
boolean finished = false;
boolean currentstate = false;

void setup() {
  background(255);


  // initialize movie for ID tag
  myMovie = new Movie(this, "videoyay.mp4");
  myMovie.loop();

  // initialize movies for alarm
  alarmMovie = new Movie(this, "alarm.mp4");
  cursedIDMovie = new Movie(this, "cursedID.mp4");
  cursedIDMovie.loop();
  alarmMovie.loop();

  //initialize movies for start and loading screen
  startScreen = new Movie(this, "start.mp4");
  loadingScreen = new Movie(this, "finished.mp4");
  startScreen.loop();
  loadingScreen.loop();

  // initialize sound for alarm
  file = new SoundFile(this, "sample.mp3");
  file2 = new SoundFile(this, "sample2.mp3");

  // initialize arduino and interaction
  arduino = new Arduino(this, 0, true, 9600);
  TestInteractible a = new TestInteractible();
  arduino.interactibles.add(a);

  // intitialize objects
  alarm = new Alarm(300);
  idTag = new IDtag();
  questions = new Question[MAX_IMAGENUM];
  for (int i = 1; i < MAX_IMAGENUM-1; i++) {
    questions[i] = new Question(i);
  }
  socialScore = new SocialScore(700);
  timer = new Timer();
  caseTimerValue = 250;
  
  fullScreen();
  
  loadScreen = new LoadScreen(caseTimerValue);
  
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this, 1280, 960, cameras[0]); //change it to 1 for the movable camera
  video.start();
  
  
}

void captureEvent(Capture video){
  video.read();
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
  if (caseTimer == caseTimerValue) {
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
    resetMovieTest(startScreen, 22.5);
    if (imageNum == 0) {
      image(startScreen, 0, 0);
    } else {
      questions[imageNum].render();
    }
    
    if (imageNum != 0) {
      timer.render(imageNum);
    }
    //file.stop();
    //file2.stop();
    break;

    // finish screen
    case(1):
    resetMovieTest(loadingScreen, 22.5);
    image(loadingScreen, 0, 0);
    //questions[MAX_IMAGENUM-1].render();
    //loadScreen.render();
    break;

    // final ID tag display
    case(2):
    resetMovieTest(myMovie, 22.5);
    image(myMovie, 0, 0);
    idTag.update(socialScore.score);
    idTag.render();
    copy(video,350, 0, 483, 640, 108, 220, 483, 640);
    break;

    // alarm question
    case(3):
    resetMovieTest(alarmMovie, 5.0);
    resetMovieTest(cursedIDMovie, 22.5);
    alarm.render(timer.timeUp());
    break;
  }
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

void mouseClicked() {
  exit();
}
