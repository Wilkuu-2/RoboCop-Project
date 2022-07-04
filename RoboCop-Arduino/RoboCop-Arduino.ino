/*
  Arduino Robocop code V2

    Solve any issues with bounce by using polling

     2022 - Jakub Stachurski - github.com/Wilkuu-2

*/

#include <FastLED.h>
#define NUM_LEDS 80
#define DATA_PIN 9


const int startBtn = 10;
const int yesBtn = 11;
const int noBtn = 12;
const int ledPin =  9;
CRGB leds[NUM_LEDS];
int ledStatus = 9;
int pLedStatus = 0;

bool flicker;
long millisSwitch = 0;
const long flickerDelay = 800;

// -- Entry
void setup() {

  Serial.begin(9600);
  pinMode(startBtn, INPUT);
  pinMode(  yesBtn, INPUT);
  pinMode(   noBtn, INPUT);
  pinMode(  ledPin, OUTPUT);
  FastLED.addLeds<NEOPIXEL, DATA_PIN>(leds, NUM_LEDS); // Start up neopixels
}

char in[6];

// -- Repeat
void loop() {
  char message[] = "ANNNN\n"; //message layout
  // Wait for processing to ask for output
  if ( Serial.available() > 5) {
    for (int i = 0; i < 6; i++) {
      in[i] = char(Serial.read());
    }
    //Serial.readString();
    ledStatus = ((uint8_t)in[4] - 48); // Convert ASCII char to int

    // Using direct pin register access to get more preformance out of reading
    char start =  PINB & 1 << 2  ? 'Y' : 'N';
    char yes =    PINB & 1 << 3  ? 'Y' : 'N';
    char no =     PINB & 1 << 4  ? 'Y' : 'N';
    char led =    (char)(48 + ledStatus); //Convert int to ASCII CHAR;

    //Send The data as string using a formatted string to ensure message length
    sprintf(message, "A%c%c%c%c\n", start, yes, no, led); //https://www.cplusplus.com/reference/cstdio/sprintf/
    Serial.print(message); //If only serial had some sort of printf functionality instead of me having to use sprintf on a buffer
    Serial.flush();        //Making sure the message is sent
  } else if (pLedStatus != ledStatus) { // LED segment selector
    switch (ledStatus) {
      case (0):
        for (int i = 0; i < NUM_LEDS; i++) {
          leds[i] = CRGB::Black;
        }
        break;
      case (1):
        for (int i = 32; i < 48; i++) {
          leds[i] = CRGB::Red;
        }
        break;
      case (2):
        for (int i = 24; i < 32; i++) {
          leds[i] = CRGB::Red;
        }
        break;
      case (3):
        for (int i = 48; i < 56; i++) {
          leds[i] = CRGB::Red;
        }
        break;
      case (4):
        for (int i = 16; i < 24; i++) {
          leds[i] = CRGB::Red;
        }
        break;
      case (5):
        for (int i = 56; i < 64; i++) {
          leds[i] = CRGB::Red;
        }
        break;
      case (6):
        for (int i = 8; i < 16; i++) {
          leds[i] = CRGB::Red;
        }
        break;
      case (7):
        for (int i = 64; i < 72; i++) {
          leds[i] = CRGB::Red;
        }
        break;
      case (8):
        for (int i = 0; i < 8; i++) {
          leds[i] = CRGB::Red;
        }
        for (int y = 72; y < 80; y++) {
          leds[y] = CRGB::Red;
        }
        break;
      default:;
    }
    pLedStatus = ledStatus;
    FastLED.show();
  } else if (ledStatus == 9 && millis() > millisSwitch) { // A system to flicker when the installation is idle
    flicker = !flicker;

    if (flicker) {
      for (int i = 0; i < NUM_LEDS; i++) {
        leds[i] = CRGB::Black;
      }

    } else {
      for (int i = 0; i < NUM_LEDS; i++) {
        leds[i] = CRGB::Red;
      }
    }

    FastLED.show();
    millisSwitch = millis() + flickerDelay; // Reset timer
  }
}
