


class Video extends DummyInteractible implements Displayable {
  JSONObject vObj;
  boolean loop = false;
  String next;
  String name;
  float duration;
  Movie mov;

   Video(JSONObject obj) {
    println("+----[VIDEO: INIT]---+");
    vObj = obj;
    
    String path = dataPath + obj.getString("vidPath");
    mov = loadMovie(path);
    
    name = obj.getString("name");
    next = obj.getString("next");
    assert name != null : "[VIDEO][ERROR] Nameless video detected!";
    assert next != null : String.format("[VIDEO]<%s>: target missing!",name);
    debugPrintln("path: " + path);
    debugPrintln("next: " + next);
    
    
    try {
      loop = obj.getBoolean("loop");
    }
    catch(NullPointerException e) {
      loop = false;
    }
    debugPrintln("loop: " + loop);
    try {
      duration = obj.getFloat("duration");
      debugPrintln("duration: "+ duration +"s");
    }
    catch(Exception e) {
      duration = mov.duration();
      debugPrintln("could not find duration, using movie duration: " + duration +"s");
    }
    println("+--------------------+");
  }

  void display() {
    if (mov.time() >=  duration) {
      if (!loop) {
        println("Loading next: " + next);
        mov.pause();
        if (next != null && next != " ") {
          resolveTarget(next);
        }
       return;
      }
    }
    image(mov, 0, 0, size.x, size.y);
    display2();
  }
  
  // Draw on top of the video
  void display2(){}


  void breakLoop() {
    loop = false;
  }


  void start() {
    try {
      loop = vObj.getBoolean("loop");
    }
    catch(NullPointerException e) {
      loop = false;
    }

    mov.jump(0);
    if (loop)
      mov.loop();
    else
      mov.play();
  }   
  void debugPrintln(String in){
    println("[VIDEO]<"+ name +">: " + in);
  }

}
