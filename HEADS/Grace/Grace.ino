#include <Scissors.h>


Scissors messageFromClient;        // SCISSORS parse messages

int clara=0;
int rhonda=0;
int grace=0;
int blanche=0;

int led = 13;

////////grace///////
int Ggreen = 6;
int Gblue = 5;  
int Gred = 3; 


int GgreenVal;
int GredVal;
int GblueVal;


void setup() {
  messageFromClient.begin(19200);

  pinMode(Ggreen,OUTPUT);
  pinMode(Gblue,OUTPUT);
  pinMode(Gred,OUTPUT);

  GgreenVal = 0;
  GredVal = 255;
  GblueVal = 255;

}


void loop(){

  if (messageFromClient.update() > 0) {         // poll the SCISSOR object -- any new MESSAGES (returns element count)
    clara = messageFromClient.getInt(0);  // extract ELEMENT 1 from MESSAGE -- ELEMENT(1) is an INT
    rhonda = messageFromClient.getInt(1);
    grace = messageFromClient.getInt(2);
    blanche = messageFromClient.getInt(3);
  }

  if (grace == 1) {
    analogWrite(Ggreen, GgreenVal);
    analogWrite(Gred, GredVal);
    analogWrite(Gblue, GblueVal);
  }
  if (grace != 1) {  
    analogWrite(Ggreen, GgreenVal);
    analogWrite(Gred, GredVal);
    analogWrite(Gblue, GblueVal);
    delay(200);
    analogWrite(Ggreen, 255);
    analogWrite(Gred, 255);
    analogWrite(Gblue, 255);
    delay(250);  
  }

  //  ////////////////////////////////////////////////

  if ((clara == 1) && (grace == 1) && (rhonda == 1)){

    GredVal = 0;
    GgreenVal = 0;
    GblueVal = 0;

  } 

  else if((grace == 1) && (clara == 1)){

    GredVal = 255;
    GgreenVal = 0;
    GblueVal = 0;

  }

  else if((grace == 1) && (rhonda == 1)){

    GredVal = 0;
    GgreenVal = 0;
    GblueVal = 255;

  }

  else {

    GgreenVal = 0;
    GredVal = 255;
    GblueVal = 255;

  }
}


