class IDCard extends Video {

  // Capture
  Capture cam;


  // Display data
  int score;
  int sectorNum;
  String citizenNum;
  String date;
  String occupation;
  int infoNum = 0;

  // Fonts
  PFont font;
  PFont font2;
  PFont font3;

  IDCard(PApplet parent, JSONObject vidObj) {
    super(vidObj);
    println("\t+----[SCOREBOARD]----+");
    println("\t[SCOREBOARD]: initializing ");
    randomize();
    println("\t+----Cameras----+");
    println("\t'>' -> Selected");
    String[] cams = Capture.list();
    for (int i = 0; i < cams.length; i++) {
      System.out.printf("\t%c[%02d] <%s>\n", i == camInd ?'>':' ',
        i,
        cams[i]);
    }


    cam = new Capture(parent, 1280, 960, cams[camInd]);
    cam.start();
    println("\t[SCOREBOARD] Initializing fonts");
    font = createFont("OpenSans-Bold.ttf", 50);
    font2 = createFont("OpenSans-Bold.ttf", 65);
    font3 = createFont("OpenSans-Regular.ttf", 40);
    println("\t+---------------+");
  }


  public void randomize() {
    sectorNum = round(random(111, 999));
    int day =   round(random(1, 28));
    int month = round(random(1, 13));
    int year =  round(random(2076, 2090));

    date       = String.format("%02d/%02d/%04d", day, month, year);
    citizenNum = String.format("EARTH%05d%05d", round(random(923, 99999)), round(random(923, 99999)));
  }

  public void passState(State s) {
    randomize();
    score = s.score;

    // Get occupation
    if (round(random(0, 3)) == 1) {
      switch(round(random(1, 5))) {
        case(1):
        occupation = "Dream Supplier";
        break;
        case(2):
        occupation = "Productivity Officer";
        break;
        case(3):
        occupation = "Media Remixer";
        break;
        case(4):
        occupation = "Nostalgist";
        break;
      }
    } else {
      if (score > 890) {
        occupation = "Supreme Leader";
      } else if (score > 850) {
        occupation = "RobotVet";
      } else if (score > 700) {
        occupation = "Telesurgeon";
      } else if (score > 550) {
        occupation = "Drone Mechanist";
      } else if (score > 400) {
        occupation = "End of Life Therapist";
      } else if (score > 300) {
        occupation = "Cult Leader";
      } else {
        occupation = "Air Purifier";
      }
    }

    //Get info text
    if (!s.isHuman)
      infoNum = 9;
    else if (s.isEmpathetic)
      infoNum = 10;
    else if (s.pineApplePizza)
      infoNum = 11;
    else if (s.isBrave)
      infoNum = 12;
    else if (!s.isPessimistic)
      infoNum = 13;
    else
      infoNum = round(random(0, 8));
      
    if(score >= 950){
      arduino.ledLevel = 8;
    } else if(score >= 900){
      arduino.ledLevel = 7;
    } else if(score >= 800){
      arduino.ledLevel = 6;
    } else if(score >= 650){
      arduino.ledLevel = 5;
    } else if(score >= 450){
      arduino.ledLevel = 4;
    } else if(score >= 300){
      arduino.ledLevel = 3;
    } else if(score >= 150){
      arduino.ledLevel = 2;
    } else{
      arduino.ledLevel = 1;
    } 
  }

  @Override public
    void display2() {
    pushMatrix();
    translate(90, 70);

    fill(255);
    textFont(font);
    textAlign(LEFT);
    text(occupation, 860, 220);
    text(sectorNum, 1240, 150);
    text(date, 885, 290);
    text(citizenNum, 790, 90);
    popMatrix();

    pushMatrix();
    translate(660, 610);
    fill(255);
    textFont(font3);
    textAlign(CENTER);
    textLeading(50);
    text(infoText[infoNum], 40, 0, 786, 256);
    popMatrix();

    pushMatrix();
    translate(1504, 116);
    line(190, 0, 190, 193);
    fill(255);
    textFont(font2);
    textAlign(CENTER);
    text(score + "/1000", 190, 145);
    popMatrix();

    if (cam.available())
      cam.read();
    copy(cam, 350, 0, 483, 640, 108, 220, 483, 640);
  }
}



static final String[] infoText = {"This human enjoys the simplicity of the past and indulges in stuff from the 2020s. They suffer from imposter syndrome but still strive to succeed in life.",
  "This well educated citizen represents the finer side of humanity, giving a kind reminder of all the good in the world.",
  "This person does the best they can do with what they have and strive to achieve their goals.",
  "This model citizen does their best to max out their social score and reap its benefits for the greater good.",
  "This citizen would like to make a change in the world, whether big or small, and inspire others to do the same.",
  "This adventurous human likes to indulge in the creative expressions of art and technology, enjoying the crafts made by humans and nature.",
  "This person is empathetic and wants to help people learn from their mistakes.",
  "This kind person enjoys serene environments and exploring the wacky things in life. They like to indulge in earthly desires.",
  "This charming person radiates joy and is humble, working as an example citizen for the 22nd century.",
  "We welcome this non-human with open arms, in compliance with the intergalactic peace treaty. Indebted to SpaceX.", //9
  "This person is empathetic and wants to help people learn from their mistakes.", //10
  "This human is exceptional, because they appreciate the finer things in life... pineapple pizza. I'm lovin' it.", //11
  "This human is fearless and knows how to pick their battles... most of the time.", //12
  "This person always tries to see the bright side of things, and strives towards excellence.", };                    //13
