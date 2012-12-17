#include <Scissors.h>
Scissors messageFromClient;        // SCISSORS parse messages

int clara;
int rhonda;
int grace;
int blanche;

int led = 13;

int greenPin = 11;
int bluePin = 10;
int redPin = 9;

int greenVal;
int redVal;
int blueVal;

void setup() {
  messageFromClient.begin(19200);
  pinMode(led, OUTPUT);

  redVal = 255;
  greenVal = 255;
  blueVal = 100;
}


void loop(){

  if (messageFromClient.update() > 0) {         // poll the SCISSOR object -- any new MESSAGES (returns element count)
    clara = messageFromClient.getInt(0);  // extract ELEMENT 1 from MESSAGE -- ELEMENT(1) is an INT
    rhonda = messageFromClient.getInt(1);
    grace = messageFromClient.getInt(2);
    blanche = messageFromClient.getInt(3);
  }

  if (blanche == 1) {
    //digitalWrite(led, HIGH);

    analogWrite(greenPin, greenVal);
    analogWrite(redPin, redVal);
    analogWrite(bluePin, blueVal);

  }

  if (blanche != 1) {  
    analogWrite(greenPin, greenVal);
    analogWrite(redPin, redVal);
    analogWrite(bluePin, blueVal);
    delay(100);
    analogWrite(greenPin, 255);
    analogWrite(redPin, 255);
    analogWrite(bluePin, 255);
    delay(100);  
  }

  ////////////////////////////////////////////////

  if((clara == 1) && (rhonda == 1) && (grace == 1)){
    redVal = 0;    
    greenVal = 255;
    blueVal = 255;
  }
   if((clara == 1) && (rhonda == 1) && (blanche == 1)){
    redVal = 0;
    greenVal = 255;
    blueVal = 255;
  }
  if((clara == 1) && (grace == 1) && (blanche == 1)){
    redVal = 0;
    greenVal = 255;
    blueVal = 255;
  }
   if((clara == 1) && (rhonda == 1)){
    redVal = 255;
    greenVal = 255;
    blueVal = 0;
  }
  if((clara == 1) && (grace == 1)){
    redVal = 255;
    greenVal = 0;
    blueVal = 255;
  }
  if((clara == 1) && (blanche == 1)){
    redVal = 255;
    greenVal = 255;
    blueVal = 0;
  }
  else {
    redVal = 170;
    greenVal = 110;
    blueVal = 255;
  }

}








