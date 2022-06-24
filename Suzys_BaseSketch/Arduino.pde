/*
 ARDUINO TAB
 In this tab all functions for communication with arduino
 */



class Arduino {
  static final int    messageLen  = 6;
  static final String pollMessageTemplate = "PNNN%c\n";
  static final long   waitMs      = 1;

  Serial port;

  boolean prevStart = false;
  boolean prevYes   = false;
  boolean prevNo    = false;

  boolean started   = false;

  boolean arduinoEnabled = true;
  String portOutput = "";
  boolean DEBUG;
  ArrayList<Interactible> interactibles;

  Arduino(PApplet parent, int initPort, boolean debug, int baudr) {
    DEBUG = debug;
    if (DEBUG) {
      println("Available serial ports:");
      printArray(Serial.list());
    }
    try {
      port = new Serial(parent, Serial.list()[initPort]);
    }
    catch (ArrayIndexOutOfBoundsException a) {
      println("Arduino not found: using keyboard only");
    }

    interactibles = new ArrayList<Interactible>();
  }
  void run() {
    if (arduinoEnabled) {
      port.write(String.format(pollMessageTemplate,
                                started ? 'Y' : 'N'));
      // Wait for the message to be sent in
      do {
        try {
          Thread.sleep(waitMs);
          println("Waiting: " +port.available()+ "\6");
        }
        catch (InterruptedException e) {
          println("Waiting has been interrupted");
          break;
        }
      } while (port.available() < messageLen);

      portOutput = port.readString();
      dbgPrintln(portOutput);

      assert portOutput.charAt(0) == 'A' && portOutput.charAt(5) == '\n' :
      "Invalid message recieved"; // A hard attemt to avoid errors, pretty extreme, maybe drop instead?

      boolean start = portOutput.charAt(1) == 'Y';
      boolean yes   = portOutput.charAt(2) == 'Y';
      boolean no    = portOutput.charAt(3) == 'Y';
      // boolean led   = portOutput.charAt(4) == 'Y';

      if (start && !prevStart) {
        started = !started;
        startPressed(started);
      }
      if (yes && !prevYes) {
        yesPressed();
      }
      if (no && !prevNo) {
        noPressed();
      }

      prevStart = start;
      prevYes   = yes;
      prevNo    = no;
    } else {
      prevStart = false;
      prevYes   = false;
      prevNo    = false;
    }

    portOutput = "";
  }

  void runKey(char keyChar) {
    switch(keyChar) {
      case(' ') :
      started = !started;
      startPressed(started);
      prevStart = true;
      break;
      case('a') :
      yesPressed();
      prevYes = true;
      break;
      case('s') :
      yesPressed();
      prevYes = true;
      break;
    }
  }

  void startPressed(boolean on) {
    for (Interactible i : interactibles)
      i.startPressed(on);
  }
  void noPressed() {
    for (Interactible i : interactibles)
      i.noPressed();
  }
  void yesPressed() {
    for (Interactible i : interactibles)
      i.yesPressed();
  }

  void dbgPrintln(String in) {
    if (DEBUG)
      println("[Arduino]: " + in);
  }
}
