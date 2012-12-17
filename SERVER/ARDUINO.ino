
//  Example:: Scissors as an RFID tag reader 
//  Scissors can be used with RFID tag readers.

//  Match the BAUD in .begin() call to the BAUD of your reader.
//  Set DELIMITER to -1
//  Set START_BYTE and END_BYTE to match tag structure.

// Example developed by hex705 (Steve Daniels)
// github.com/hex705


#include <Glue.h> // IMPORT GLUE LIBRARY

Glue messageToServer;          // GLUE builds MESSAGES - SETTING UP VARIABLE

#include <Scissors.h>


Scissors RFID_reader;

String newTag = "";
String oldTag ="";

int ledPin = 13;  

long startTime = 0;
long resetTime = 0;

void setup() {

  RFID_reader.begin(2400); 
  messageToServer.create();    //  create your GLUE message -- this sets aside some memory

  // scissors needs to have the package structure set to match RFID tags.
  // each tag send a message of form:
  // START_BYTE payload_of_length_10_bytes END_BYTE

  RFID_reader.setStartByte( 0x0A ); // 10 == start_byte
  RFID_reader.setEndByte  ( 0x0D ); // 13 == end_byte
  RFID_reader.setDelimiter( -1 );   // no delimiters 

  // all of the above could be replaced with the following
  // RFID_reader.begin(2400,10,13,-1); 

  pinMode(ledPin, OUTPUT);  
  resetTime = millis();
} 



void loop () {
  // NEW STUFF WHICH ALLOWS US TO KNOW WHEN A TAG ISN'T ON THE READER

  if ( RFID_reader.update() > 0 ) {         // poll the SCISSOR object -- any new MESSAGES (returns element count)


    newTag = RFID_reader.getString(0);       // get ELEMENT 2 from MESSAGE -- assuming ELEMENT(2) is a  float     

//    if ( ! newTag.equals(oldTag) ) {
//        Serial.println(newTag);                 // only print new tags that are different than last tag  
//    }
  
    // CLARA
    if (newTag.equals("01023C3076") ) {
      digitalWrite(ledPin, HIGH);
      messageToServer.clear();                   // clear the old message
      messageToServer.add( "01023C3076" );          // add the actual dialValue (int)
      Serial.println( messageToServer.getPackage()) ;
      // Serial.println("ON");
    }
    // RHONDA
    if (newTag.equals("010230ECBA") ) {
      digitalWrite(ledPin, LOW);
      messageToServer.clear();                   // clear the old message
      messageToServer.add( "010230ECBA" );          // add the actual dialValue (int)
      Serial.println( messageToServer.getPackage()) ;
      //Serial.println("OFF");
    }
    // GRACE
     if (newTag.equals("0106935FED") ) {
      digitalWrite(ledPin, HIGH);
      messageToServer.clear();                   // clear the old message
      messageToServer.add( "0106935FED" );          // add the actual dialValue (int)
      Serial.println( messageToServer.getPackage()) ;
      // Serial.println("ON");
    }
    // BLANCHE
    if (newTag.equals("01069358CE") ) {
      digitalWrite(ledPin, LOW);
      messageToServer.clear();                   // clear the old message
      messageToServer.add( "01069358CE" );          // add the actual dialValue (int)
      Serial.println( messageToServer.getPackage()) ;
      //Serial.println("OFF");
    }

    oldTag = newTag;

    startTime = millis();


  }

  if ((millis()-startTime) > 1000) {
        messageToServer.clear();                    
        messageToServer.add( "RESET" ); //"2" makes the box red
        Serial.println( messageToServer.getPackage()) ;
        startTime = millis();
  }

  delay(100); // 2400 BAUD is fairly slow -- a little delay helps keep the system from bogging down

} 

