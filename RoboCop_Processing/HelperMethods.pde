void loadVideos() {
  videos = new HashMap<String, Video>();

  JSONArray vids = qJSON.getJSONArray("videos");
  for (int i = 0; i < vids.size(); i++) {
    var vidObj = vids.getJSONObject(i);
    var vidName = vidObj.getString("name");
    
    if (vidName.contains("!scoreBoard")) {
      videos.put(vidName, new IDCard(this,vidObj));     
    } else
      try{
      videos.put(vidName, new Video(vidObj));
      } catch(RuntimeException e) {
        println("[VIDEO]: " + vidName + "skipped");
      }
  }
}


Movie loadMovie(String path) {
  return new Movie(this, path);
}

SoundFile loadSoundFile(String path){
  return new SoundFile(this,path);
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
  if(state.isShortTimed(timer)){
    resolveTarget("!shortTimeEv");
  } else {
  currentQuestion = q;
  if (q!= null){
    arduino.interactibles[1] = q;
    if(q.useTimer){
      timer = new Timer(round(1000*max(3,(10-1f*state.questionsAnswered+10f*pow(2,-state.questionsAnswered))))); // timer algo
    } else { 
      timer = null; 
    }
    currentDisplayable = q;
    q.wasSelected = true; 
   }
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
  if(currentDisplayable instanceof Video){
    ((Video) currentDisplayable).breakLoop();
  }
  
  if (name.charAt(0) == '?') {
    println("[SWITCH] Redirected to pool -> " + name);
    questionPools.get(name).useRandomOrEnd();
  } else if (name.charAt(0) == '!') {
    println("[SWITCH] Switched to video -> " + name);
    var vid = videos.get(name);
    assert vid != null : "[SWITCH] Video: "+ name + " does not exist."; 
    setVideo(vid);
  } else {
    println("[SWITCH] Switched to question -> " + name);
    var q = looseQuestions.get(name);
    assert q != null : "[SWITCH] Video: "+ name + " does not exist."; 
    setQuestion(q);
  }
}

boolean hasTarget(String name){
  if (name.charAt(0) == '?') {
    return questionPools.get(name) != null; 
  } else if (name.charAt(0) == '!') {
    return  videos.get(name) != null; 
  } else {
    return looseQuestions.get(name) != null;
  }

}
