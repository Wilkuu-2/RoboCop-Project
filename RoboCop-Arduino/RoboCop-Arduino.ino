/*
  Arduino Robocop code V2

    Solve any issues with bounce by using polling

     2022 - Jakub Stachurski - github.com/Wilkuu-2

*/
const int startBtn = 8;
const int yesBtn = 9;
const int noBtn = 10;
const int ledPin =  7;

int ledStatus = 0;

// -- Entry
void setup() {  
  Serial.begin(9600);
  pinMode(startBtn, INPUT);
  pinMode(  yesBtn, INPUT);
  pinMode(   noBtn, INPUT);
  pinMode(  ledPin, OUTPUT);

}

char in[6]; 

// -- Repeat
void loop() {
  char message[] = "ANNNN\n"; //message layout
  // Wait for processing to ask for output
  if ( Serial.available() > 5) { 
    for(int i = 0; i < 6; i++){
      in[i] = char(Serial.read());
    }
    ledStatus = (uint8_t)(in[4]-48); // Convert ASCII char to int 

    // Using direct pin register access to get more preformance out of reading 
    char start =  PINB & 1 << 0  ? 'Y' : 'N';
    char yes =    PINB & 1 << 1  ? 'Y' : 'N';
    char no =     PINB & 1 << 2  ? 'Y' : 'N';
    char led =    (char)(48 + ledStatus); //Convert int to ASCII CHAR;

    //Send The data as string using a formatted string to ensure message length
    sprintf(message, "A%c%c%c%c\n", start, yes, no, led); //https://www.cplusplus.com/reference/cstdio/sprintf/
    Serial.print(message); //If only serial had some sort of printf functionality instead of me having to use sprintf on a buffer
  }
  else {
    digitalWrite(ledPin, ledStatus > 0);
  }
  delay(2); //We don't need to go too fast
}
