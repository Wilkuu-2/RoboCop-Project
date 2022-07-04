class Question implements Displayable, Interactible{
  JSONObject qObj;
  String name;
  PImage img; 
  boolean useTimer = true;
  boolean wasSelected = false;  
  String yesNext;
  String noNext;
  
  Question(JSONObject obj){
    qObj = obj;
    
    name = obj.getString("name");
    assert name != null : "[QLOAD][ERROR] Nameless question detected!";
    
    String imagePath = dataPath +  obj.getString("imgPath");
    img = loadImage(imagePath);
    
    var answerObj = qObj.getJSONObject("yes");
    
    assert answerObj != null : "[QLOAD][ERROR]<" +name+ ">: Answer\"yes\" is missing!"; 
    yesNext = answerObj.getString("next");

    assert yesNext != null   : "[QLOAD][ERROR]<" +name+ ">: No target for \"yes\"";
    
    answerObj = qObj.getJSONObject("no");
    assert answerObj != null : "[QLOAD][ERROR]<" +name+ ">: Answer\"no\" is missing!"; 

    noNext = answerObj.getString("next");
    assert noNext != null   : "[QLOAD][ERROR]<" +name+ ">: No target for \"no\"";
    
    System.out.printf("|%-20s| %-20s | %-20s |\n", name, yesNext, noNext);
    
    try {
      useTimer = obj.getBoolean("timer");
    }
    catch(NullPointerException e) {
      useTimer = true;
    }
    
    
  }

   public void onPoolSwitchOn(String poolName){
      System.out.printf("[QLOAD] %-10s ->> %-10s\n", poolName, name);

   }
  
   public void display(){
    image(img, 0, 0, size.x, size.y);
  }
  
   public void startPressed(boolean isOn){}

  //Enter your code that should happen when the YES button is clicked
   public void yesPressed(){
    answer(true);
  }

  //Enter your code that should happen when the NO button is clicked
   public void noPressed(){
    answer(false);
  }
  
   public void answer(boolean b){
    state.questionsAnswered++;
    
    String objString = b ? "yes" : "no";
    var answerObj = qObj.getJSONObject(objString);
    assert answerObj != null : "Answer\""+ objString + "\" is missing for: " + name; 
    
    var vars = answerObj.getJSONArray("vars");
    if(vars != null){
      state.setVarsFromJSON(vars);
    }
    state.addScore(answerObj.getFloat("scoreMin"),answerObj.getFloat("scoreMax"));
    
    var path = answerObj.getString("next");
    resolveTarget(path); 
    
  }
  
  
 
}
