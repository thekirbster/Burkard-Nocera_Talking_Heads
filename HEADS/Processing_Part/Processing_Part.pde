/*
 * 
 * teleClient_n
 * 
 * simple teleClient -- connects to teleServer to obtain sensor data passes it to ARDUINO
 *
 * all messages are parsed and assembled with SCISSORS and GLUE
 *
 * based on server example in Shiffman -- learning processing
 *
 * 
 */

import processing.serial.*;   // import the serial library
import processing.net.* ;        // import the net library

Client teleClient ;              // declare a CLIENT object
String serverIP = "10.16.154.38";   // set to MATCH the IP of the SERVER (where is the server?)
int    serverPORT = 12345;       // set to MATCH the PORT on which the SERVER is listening?

Scissors parseMessagesFromServer;  // create a SCISSORS object to parse INCOMING messages from SERVER

String message;
String clara;
String rhonda;
String grace;
String blanche;

Serial Grace;      // setup a Serial PORT
Serial RhondaClara;


Glue messageGrace = new Glue();  // create a GLUE OBJECT to to help assemble OUTGOING SERIAL messages
Glue messageRhondaClara = new Glue();


void setup() {

  size( 700, 700 );
  background(67);

  // start client to get messages
  teleClient = new Client( this, serverIP, serverPORT );     // connect client to SERVER IP and SERVER PORT
  parseMessagesFromServer = new Scissors( teleClient );      // attach parser (SCISSORS) to the CLIENT

  // start the serial port
  println(Serial.list());  // List all the available serial ports

  // connect this sketch to the USB port of your Arduino at specified BAUD
  Grace = new Serial(this, Serial.list()[0], 19200);  // match baud and PORT 
  RhondaClara = new Serial(this, Serial.list()[2], 19200);
}

void draw() {

  //  while (clientSerialPort.available () > 0) {
  //    print(clientSerialPort.readChar());
  //  }

  if (  parseMessagesFromServer.update() > 0 ) {   //  polls CLIENT and returns number of ELEMENTS in MESSAGEs

    background(67);

    int clara = parseMessagesFromServer.getInt(0);  // extract ELEMENT one (1) from the MESSAGE -- it is an INT
    int rhonda = parseMessagesFromServer.getInt(1);
    int grace = parseMessagesFromServer.getInt(2);
    int blanche = parseMessagesFromServer.getInt(3);

    println();
    fill(255);  

    // use GLUE to build a new message to be passed to local Arduino
    messageGrace.clear();                         // start fresh :: clear the last OUTGOING message
    messageGrace.add( clara );
    messageGrace.add( rhonda );
    messageGrace.add( grace );
    messageGrace.add( blanche );

    messageRhondaClara.clear();                         // start fresh :: clear the last OUTGOING message
    messageRhondaClara.add( clara );
    messageRhondaClara.add( rhonda );
    messageRhondaClara.add( grace );
    messageRhondaClara.add( blanche );

    // add a prefix to our message -- BE POLITE -- tell recipient who is talking


    rect(width/2-300, height/2-300, 600, 600);  

    String messageToGrace = messageGrace.getPackage();     // put the WHOLE message in a STRING
    messageGrace.debug();

    String messageToRhondaClara = messageRhondaClara.getPackage();     // put the WHOLE message in a STRING
    messageRhondaClara.debug();
    
    Grace.write(messageToGrace);
    RhondaClara.write(messageToRhondaClara);

    // use SERIAL method .write() to send a message to local ARDUINO
  }

  // YOUR CODE HERE
} // end draw

