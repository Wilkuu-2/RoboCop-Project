/*
  Arduino Robocop code V2

    Solve any issues with bounce by using polling
    
     2022 - Jakub Stachurski - github.com/Wilkuu-2

*/
const int startBtn = 8;
const int yesBtn = 9;
const int noBtn = 10;
const int ledPin =  7;

bool ledStatus = false; 

// -- Entry
void setup() {
  Serial.begin(9600);
  pinMode(startBtn, INPUT);
  pinMode(  yesBtn, INPUT);
  pinMode(   noBtn, INPUT);
  pinMode(  ledPin, OUTPUT);

}

// -- Repeat
void loop() {
  char message[] = "ANNNN\n"; //message layout
  // Wait for processing to ask for output
  if ( Serial.available() > 5) {
    //Discard everything Processing sent TODO: SET LED USING PROCESSING
    while (Serial.available()) {
      Serial.read();
    }

    char start = (digitalRead(startBtn)) ? 'Y' : 'N';
    char yes =     (digitalRead(yesBtn)) ? 'Y' : 'N';
    char no =       (digitalRead(noBtn)) ? 'Y' : 'N';
    char led =               (ledStatus) ? 'Y' : 'N';
    
    //Send The data as string using a formatted string to ensure message length
    sprintf(message, "A%c%c%c%c\n", start, yes, no, led); //https://www.cplusplus.com/reference/cstdio/sprintf/
    Serial.print(message); //If only serial had some sort of printf functionality instead of me having to use sprintf on a buffer

  }
  delay(9); //We don't need to go too fast
}
