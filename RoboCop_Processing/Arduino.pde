/*
 ARDUINO TAB
 In this tab all functions for communication with arduino
 */



class Arduino {
  static final int    messageLen  = 6;
  static final String pollMessageTemplate = "PNNN%1d\n";
  static final long   waitMs      = 1;
  static final long   dropMs      = 13;

  Serial port;

  boolean prevStart = false;
  boolean prevYes   = false;
  boolean prevNo    = false;

  boolean started   = false;
  int ledLevel = 0; 
   
  boolean arduinoEnabled = true;
  String portOutput = "";
  boolean DEBUG;
  Interactible [] interactibles;

  Arduino(PApplet parent, int initPort, boolean debug, int baudr) {
    DEBUG = debug;
    if (DEBUG) {
      println("Available serial ports:");
      printArray(Serial.list());
    }
    try {
      port = new Serial(parent, Serial.list()[initPort], baudr);
    }
    catch (ArrayIndexOutOfBoundsException a) {
      println("Arduino not found: using keyboard only");
      arduinoEnabled = false;
    }

    interactibles = new Interactible[2];
  }
  void run() {
    if (arduinoEnabled) {
        //dbgPrintln("Sending message");
      port.write(String.format(pollMessageTemplate,
                                started ? ledLevel : 9));
      dbgPrint(String.format(pollMessageTemplate,
                                started ? ledLevel : 9));
      // Wait for the message to be sent in
      do {
        try {
          Thread.sleep(waitMs);
          //dbgPrintln("Waiting: " + port.available() + "/6");
        }
        catch (InterruptedException e) {
          assert false; 
          break;
        }
      } while (port.available() < messageLen);

      portOutput = port.readString();
      dbgPrint(portOutput);

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
      noPressed();
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
  void dbgPrint(String in) {
    if (DEBUG)
      print("[Arduino]: " + in);
  }
}
