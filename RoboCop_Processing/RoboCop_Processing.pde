import java.util.HashMap;
import processing.serial.*;
import processing.video.*;

Arduino arduino;
Timer timer; 

// New globals
final static String dataPath = "/store/Study/RoboCop-Project/Suzys_BaseSketch/data/";
final static String questionJSONpath = "./questions.json";
static final int camInd = 1;

JSONObject qJSON;
HashMap<String, Video>        videos;
HashMap<String, QuestionPool> questionPools;
HashMap<String, Question>     looseQuestions;


Question currentQuestion;
Displayable currentDisplayable;
State state;



void setup() {
  //size(900, 900);
  fullScreen();
  Displayable.size.x = width;
  Displayable.size.y = height;

  qJSON = loadJSONObject(questionJSONpath);

  loadVideos();

  arduino = new Arduino(this, 0, false, 9600);
  state = new State();
  arduino.interactibles[0] = state;
  loadQuestions();
  reset();
}

void begin() {
  println("[BEGIN]");
  resolveTarget("?pool1");

  state = new State();
  currentDisplayable = currentQuestion;
}

void reset() {
  questionPools.forEach( (s,p) -> p.reset() );
  setVideo(videos.get("!idle"));
  print("[RESET]");
}


public void draw() {
  arduino.run();
  background(10);
  currentDisplayable.display();
  
  if(timer != null){
    timer.display();
    if(timer.isUp() && currentDisplayable instanceof Question){
        resolveTarget("!timeUp");
    }
  }
}

// read movie frames
void movieEvent(Movie m) {
  m.read();
}

void keyPressed() {
  arduino.runKey(key);
}
