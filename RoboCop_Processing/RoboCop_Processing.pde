 
 import java.util.HashMap;
import processing.serial.*;
import processing.video.*;
import processing.sound.*;

Arduino arduino;
Timer timer;

// New globals
String dataPath;
final static String questionJSONpath = "./questions.json";
static final int camInd = 0;

JSONObject qJSON;
HashMap<String, Video>        videos;
HashMap<String, QuestionPool> questionPools;
HashMap<String, Question>     looseQuestions;

boolean hasRickroll = false; 

Question currentQuestion;
Displayable currentDisplayable;
State state;



void setup() {
  //size(900, 900);
  fullScreen(1);

  dataPath = sketchPath() + "/data/"; 

  Displayable.size.x = width;
  Displayable.size.y = height;

  qJSON = loadJSONObject(questionJSONpath);

  loadVideos();
  hasRickroll = hasTarget("!rickRoll");

  arduino = new Arduino(this, 0, false, 9600);
  state = new State();
  arduino.interactibles[0] = state;
  loadQuestions();
  reset();
}

void begin() {
  println("[BEGIN]"); 
  state = new State();
  resolveTarget("?pool1");
}

void reset() {
  if (currentDisplayable instanceof Video) {
    ((Video) currentDisplayable).breakLoop();
  }
  questionPools.forEach( (s, p) -> p.reset() );
  setVideo(videos.get("!idle"));
  arduino.ledLevel = 0; 
  print("[RESET]");
}


public void draw() {

  arduino.run();

  background(10);
  currentDisplayable.display();

  if (timer != null) {
    timer.display();
    if (timer.isUp() && currentDisplayable instanceof Question) {
      resolveTarget("!timeUp");
    }
  }
}

//read movie frames
void movieEvent(Movie m) {
  m.read();
}

void keyPressed() {
  arduino.runKey(key);
}
