#include <Scissors.h>
Scissors messageFromClient;        // SCISSORS parse messages

///////////DOLLS//////////////
int clara=0;
int rhonda=0;
int grace=0;
int blanche=0;

////////////PINS//////////////
int Cgreen = 11;
int Cblue = 10;  
int Cred = 9; 
int Rgreen = 11;
int Rblue = 10;  
int Rred = 9; 
int Ggreen = 11;
int Gblue = 10;  
int Gred = 9; 

/////////COLOUR VALUE/////////
int CgreenVal;
int CredVal;
int CblueVal;
int RgreenVal;
int RredVal;
int RblueVal;
int GgreenVal;
int GredVal;
int GblueVal;

void setup() {
  messageFromClient.begin(19200);

  RgreenVal = 255;
  RredVal = 0;
  RblueVal = 255;
}


void loop(){
  if (messageFromClient.update() > 0) {         // poll the SCISSOR object -- any new MESSAGES (returns element count)
    rhonda = messageFromClient.getInt(1);  // extract ELEMENT 1 from MESSAGE -- ELEMENT(1) is an INT
  }

  if (rhonda == 1) {
    analogWrite(Rgreen, RgreenVal);
    analogWrite(Rred, RredVal);
    analogWrite(Rblue, RblueVal);
  }

  if (rhonda != 1) {  
    analogWrite(Rgreen, RgreenVal);
    analogWrite(Rred, RredVal);
    analogWrite(Rblue, RblueVal);
    delay(100);
    analogWrite(Rgreen, 255);
    analogWrite(Rred, 255);
    analogWrite(Rblue, 255);
    delay(100);  
  }

  ///////////////RELATIONSHIP//////////////////////
 
  if ((clara == 1) && (grace == 1) && (rhonda == 1)){

    CredVal = 0;
    CgreenVal = 0;
    CblueVal = 0;

    RredVal = 0;
    RgreenVal = 0;
    RblueVal = 0;

    GredVal = 0;
    GgreenVal = 0;
    GblueVal = 0;
  } 
  
  else if((clara == 1) && (grace == 1)){

    CredVal = 255;
    CgreenVal = 0;
    CblueVal = 0;

    GredVal = 255;
    GgreenVal = 0;
    GblueVal = 0;
  }

  else if((clara == 1) && (rhonda == 1)){

    CredVal = 0;
    CgreenVal = 255;
    CblueVal = 0;

    RredVal = 0;
    RgreenVal = 255;
    RblueVal = 0;
  }

  else if((grace == 1) && (rhonda == 1)){

    GredVal = 0;
    GgreenVal = 0;
    GblueVal = 255;

    RredVal = 0;
    RgreenVal = 0;
    RblueVal = 255;
  }

  else {
    CgreenVal = 255;
    CredVal = 255;
    CblueVal = 0;

    RgreenVal = 255;
    RredVal = 0;
    RblueVal = 255;

    GgreenVal = 0;
    GredVal = 255;
    GblueVal = 255;
  }
}
