void loadVideos() {
  videos = new HashMap<String, Video>();

  JSONArray vids = qJSON.getJSONArray("videos");
  for (int i = 0; i < vids.size(); i++) {
    var vidObj = vids.getJSONObject(i);
    var vidName = vidObj.getString("name");

    if (vidName.contains("!scoreBoard")) {
      videos.put(vidName, new IDCard(this,vidObj));     
    } else
      videos.put(vidName, new Video(vidObj));
  }
}


Movie loadMovie(String path) {
  return new Movie(this, path);
}

 public void loadQuestions() {
  long milliStart = millis();
  println("+----------[QLoad]-----------+");
  println("[QLOAD]: loading Questions");
  questionPools  = new HashMap<String, QuestionPool>();
  looseQuestions = new HashMap<String, Question>();
  
  System.out.printf("[QLOAD]: HashMaps initialized in %.2gs\n", (millis() - milliStart)/1000f);
  milliStart = millis();
   
  JSONArray pools = qJSON.getJSONArray("pools");
  for (int i = 0; i < pools.size(); i++) {
    var poolObject = pools.getJSONObject(i);
    QuestionPool pool = new QuestionPool(poolObject);
    questionPools.put(pool.name, pool);
  }

  System.out.printf("[QLOAD]: Pools loaded in %.2gs\n", (millis() - milliStart)/1000f);
  milliStart = millis();

  println("|-------------------------[QLOAD: LOOSE]---------------------------|");
  println("|--------name--------|---------yes->--------|----------no->--------|");
  JSONArray questions = qJSON.getJSONArray("questions");
  for (int i = 0; i < questions.size(); i++) {
    var question = new Question(questions.getJSONObject(i));
    looseQuestions.put(question.name, question);
  }
  System.out.printf("[QLOAD]: Questions loaded in %.2gs\n", (millis() - milliStart)/1000f);

}


 void setQuestion(Question q) {
  currentQuestion = q;
  if (q!= null){
    arduino.interactibles[1] = q;
    if(q.useTimer){
      timer = new Timer(round(1000*(15-0.2f*state.questionsAnswered-0.03f*pow(state.questionsAnswered,2))));
    } else {
    
    }
    currentDisplayable = q;
  }
 }
 void setVideo(Video v) {
  v.start();
  arduino.interactibles[1] = v;
  currentDisplayable = v;
  timer = null; 

  if (v instanceof IDCard) {
    ((IDCard)v).passState(state);
  }
}

 void resolveTarget(String name) {
  if (name.charAt(0) == '?') {
    println("[SWITCH] Redirected to pool -> " + name);
    questionPools.get(name).useRandomOrEnd();
  } else if (name.charAt(0) == '!') {
    println("[SWITCH] Switched to video -> " + name);
    setVideo(videos.get(name));
  } else {
    println("[SWITCH] Switched to question -> " + name);
    setQuestion(looseQuestions.get(name));
  }
}
