


class Video extends DummyInteractible implements Displayable {
  JSONObject vObj;
  boolean loop = false;
  boolean soundLoop = false;
  String next;
  String name;
  float duration;
  float soundDuration;
  Movie mov;
  SoundFile sound;

  Video(JSONObject obj) {
    println("+----[VIDEO: INIT]---+");
    vObj = obj;

    String path = dataPath + obj.getString("vidPath");
    mov = loadMovie(path);

    name = obj.getString("name");
    next = obj.getString("next");
  assert name != null :
    "[VIDEO][ERROR] Nameless video detected!";
  assert next != null :
    String.format("[VIDEO]<%s>: target missing!", name);
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

    String soundPath = obj.getString("soundPath");
    if (soundPath != null) {
      debugPrintln("[Sound] loading:" + dataPath +  soundPath);
      sound = loadSoundFile(dataPath + soundPath);
    assert sound != null :
      "[VIDEO][SOUND] loading sound: " + soundPath + " failed.";

      try {
        soundLoop = obj.getBoolean("soundLoop");
      }
      catch(NullPointerException e) {
        soundLoop = false;
      }
      debugPrintln("[Sound]loop: " + soundLoop);
      try {
        soundDuration = obj.getFloat("soundDuration");
        debugPrintln("[Sound] Duration: "+ soundDuration +"s");
      }
      catch(Exception e) {
        soundDuration = sound.duration();
        debugPrintln("[Sound] Could not find duration, using sound duration: " + soundDuration +"s");
      }
    }

    println("+--------------------+");
  }

  void display() {
    if (mov.time() >=  duration) {
      if (!loop) {
        stop();
        return;
      }
    }
    image(mov, 0, 0, size.x, size.y);
    display2();
  }

  // Draw on top of the video
  void display2() {
  }


  void breakLoop() {
    loop = false;
    soundLoop = false;
    if (sound != null)
      sound.stop();
  }

  void stop() {
    println("Loading next: " + next);
    mov.pause();
    if (sound != null) {
      sound.stop();
    }
    if (next != null && next != " ") {
      resolveTarget(next);
    }
  }

  void start() {
    try {
      loop = vObj.getBoolean("loop");
    }
    catch(NullPointerException e) {
      loop = false;
    }
    if (sound != null) {
      if (soundLoop)
        sound.loop();
      else
        sound.play();
    }

    mov.jump(0);
    if (loop)
      mov.loop();
    else
      mov.play();
  }
  void debugPrintln(String in) {
    println("[VIDEO]<"+ name +">: " + in);
  }
}
