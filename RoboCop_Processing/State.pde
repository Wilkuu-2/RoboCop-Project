

class State implements Interactible {
  int questionsAnswered = 0;
  int score = 0;
  // Custom Vars
  boolean isHuman = true;
  boolean isEmpathetic = false;
  boolean isPessimistic = true;
  boolean pineApplePizza   = false;
  boolean isBrave          = false;
  


  // Rickroll event
  boolean rickrollEnabled = true; 
  boolean hasBeenRickrolled = false;
  int     shortTimers      = 0;
  final static int maxShortTimers = 3;
  final static float shortTimerFraction = 0.06f;


  State() {
    score = round(random(400, 550));
    questionsAnswered = 0; 
    
    rickrollEnabled = rickrollEnabled && hasRickroll;
    
      // Custom Vars
    isHuman = true;
    isEmpathetic = false;
    isPessimistic = true;
    pineApplePizza   = false;
    isBrave          = false;
  }

  public void setVarsFromJSON(JSONArray arr) {
    for (int i = 0; i < arr.size(); i++ ) {
      var variable = arr.getJSONObject(i);
      var name = variable.getString("name");
      switch(name) {
        case("isHuman"):
        isHuman = variable.getBoolean("value");
        break;
        case("isEmpathetic"):
        isEmpathetic = variable.getBoolean("value");
        break;
        case("isPessimistic"):
        isPessimistic = variable.getBoolean("value");
        break;
        case("pineApplePizza"):
        pineApplePizza = variable.getBoolean("value");
        break;
        case("isBrave"):
        isBrave = variable.getBoolean("value");
        break;
        case("hasBeenRickrolled"):
        hasBeenRickrolled = variable.getBoolean("value");
        break;
      }
    }
  }
  public boolean isShortTimed(Timer t) {
    if (rickrollEnabled && !hasBeenRickrolled &&t != null && t.getFractionalProgress() < shortTimerFraction)
      shortTimers++;

    if (shortTimers >= maxShortTimers) {
      shortTimers = 0;
      return true;
    }
    return false;
  }

  public void addScore(float inMin, float inMax) {
    float nMin = min(inMin, inMax);
    float nMax = max(inMin, inMax);
    int scoreAdd = round(random(nMin, nMax));
    // score = max(0, min(1000, score + scoreAdd));
    score += max(min(scoreAdd,1000), 0 );
    System.out.printf("[SCORE]: score: %05d (%+4d)\n", score, scoreAdd);
  }

  //Enter your code that should happen when the START button is clicked
  public void startPressed(boolean isOn) {
    if (isOn) {
      begin();
    } else {
      reset();
    }
  }

  //Enter your code that should happen when the YES button is clicked
  public void yesPressed() {
  }

  //Enter your code that should happen whens the NO button is clicked
  public void noPressed() {
  }
}
