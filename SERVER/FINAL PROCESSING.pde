import processing.serial.*; // import the serial library
import processing.net.*;
Serial RFID1;
Serial RFID2;
Serial RFID3;
//Serial RFID4;

// FOR XBEE STUFF
Serial xbeePort;

Scissors scissors1;
Scissors scissors2;
Scissors scissors3;
//Scissors scissors4;

Glue xbeePacket = new Glue();
// create a GLUE OBJECT to to help assemble OUTGOING SERIAL messages

//Client myClient; 
Server myServer;
String serverIP = "10.16.133.108"; // DANTE'S IP
int serverPORT = 12345;

// DOLL VARIABLES
int RFID = 0;
//int clara, rhonda, grace, blanche;

int[] clara = new int[10];
int[] rhonda = new int[10];
int[] grace = new int[10];
//int[] blanche = new int[10];

int CLARA = 0;
int RHONDA = 1;
int GRACE = 2;
//int BLANCHE = 3;


int cnt;
int index;

void setup() {
  size(600, 600);
  println(Serial.list());
  
  
  RFID1 = new Serial(this, "/dev/tty.usbmodemfa1451", 2400); // MAKE SURE THE PORTS ARE CORRECT
  scissors1 = new Scissors (RFID1) ;
  
  
  RFID2 = new Serial(this, "/dev/tty.usbserial-A6006jHI", 2400); // MAKE SURE THE PORTS ARE CORRECT
  scissors2 = new Scissors (RFID2) ;

  RFID3 = new Serial(this, "/dev/tty.usbserial-A800evai", 2400); // MAKE SURE THE PORTS ARE CORRECT
  scissors3 = new Scissors (RFID3) ;
//
//  RFID3 = new Serial(this, "/dev/tty.usbmodemfa1411", 2400); // MAKE SURE THE PORTS ARE CORRECT
//  scissors3 = new Scissors (RFID3) ;



  // NEW PORT FOR XBEE FUNCTIONS
  xbeePort = new Serial(this, "/dev/tty.usbserial-A800ejOL", 19200);
  //xbeePort = new Serial(this, Serial.list()[99], 19200);

  //myClient = new Client(this, serverIP, serverPORT);
  myServer = new Server(this, serverPORT);
}


void draw() {

  //////////////////////////////////////////////////////////////////// RFID1
  // poll the Serial to see if anything has arrived
  if (scissors1.update() > 0) { // polls for new messages

    index = cnt%10;     // constrain index to stay within array size.

    String tagID = scissors1.getString(0); // String from the message - (0) = only bit of data sent
    //println(tagID);
    rectMode(CENTER);
    fill(0, 255, 0);
    rect(width/2, height/2, 400, 400);

    //  in the following if/then blocks -- load the value into teh array at index
    //  rather than just looking at the most recent value.
    // there is a cleaner way to do this -- but the following works.


    // IF TAG IS DETECTED, STOP LED FROM BLINKING
    if (tagID.equals("01023C3076")) { // .equals ALLOWS STRINGS TO COMPARE TO EACH OTHER
      clara[index] = 1;
      // clara = 1; // WHITE TAG
    } 
    else {
      clara[index]=0;
      //clara = 0;
    }
    if (tagID.equals("010230ECBA")) { 
      rhonda[index] = 1;
      //rhonda = 1; // BLACK TAG
    } 
    else {
      rhonda[index] = 0;
      //rhonda = 0;
    }
    if (tagID.equals("0106935FED")) { 
      grace[index] = 1; // GREEN TAG
    } 
    else {
      grace[index] = 0;
    }
//    if (tagID.equals("01069358CE")) { 
//      blanche[index]  = 1; // RED TAG
//    } 
//    else {
//      blanche[index]  = 0;
//    }
  }
  ////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////// RFID2
  // poll the Serial to see if anything has arrived
  if (scissors2.update() > 0) { // polls for new messages

    index = cnt%10;     // constrain index to stay within array size.

    String tagID = scissors2.getString(0); // String from the message - (0) = only bit of data sent
    //println(tagID);
    rectMode(CENTER);
    fill(0, 255, 0);
    rect(width/2, height/2, 400, 400);

    //  in the following if/then blocks -- load the value into teh array at index
    //  rather than just looking at the most recent value.
    // there is a cleaner way to do this -- but the following works.


    // IF TAG IS DETECTED, STOP LED FROM BLINKING
    if (tagID.equals("01023C3076")) { // .equals ALLOWS STRINGS TO COMPARE TO EACH OTHER
      clara[index] = 1;
      // clara = 1; // WHITE TAG
    } 
    else {
      clara[index]=0;
      //clara = 0;
    }
    if (tagID.equals("010230ECBA")) { 
      rhonda[index] = 1;
      //rhonda = 1; // BLACK TAG
    } 
    else {
      rhonda[index] = 0;
      //rhonda = 0;
    }
    if (tagID.equals("0106935FED")) { 
      grace[index] = 1; // GREEN TAG
    } 
    else {
      grace[index] = 0;
    }
//    if (tagID.equals("01069358CE")) { 
//      blanche[index]  = 1; // RED TAG
//    } 
//    else {
//      blanche[index]  = 0;
//    }
  }
  ////////////////////////////////////////////////////////////////////


  //////////////////////////////////////////////////////////////////// RFID3
  // poll the Serial to see if anything has arrived
  if (scissors3.update() > 0) { // polls for new messages

    index = cnt%10;     // constrain index to stay within array size.

    String tagID = scissors3.getString(0); // String from the message - (0) = only bit of data sent
    //println(tagID);
    rectMode(CENTER);
    fill(0, 255, 0);
    rect(width/2, height/2, 400, 400);

    //  in the following if/then blocks -- load the value into teh array at index
    //  rather than just looking at the most recent value.
    // there is a cleaner way to do this -- but the following works.


    // IF TAG IS DETECTED, STOP LED FROM BLINKING
    if (tagID.equals("01023C3076")) { // .equals ALLOWS STRINGS TO COMPARE TO EACH OTHER
      clara[index] = 1;
      // clara = 1; // WHITE TAG
    } 
    else {
      clara[index]=0;
      //clara = 0;
    }
    if (tagID.equals("010230ECBA")) { 
      rhonda[index] = 1;
      //rhonda = 1; // BLACK TAG
    } 
    else {
      rhonda[index] = 0;
      //rhonda = 0;
    }
    if (tagID.equals("0106935FED")) { 
      grace[index] = 1; // GREEN TAG
    } 
    else {
      grace[index] = 0;
    }
//    if (tagID.equals("01069358CE")) { 
//      blanche[index]  = 1; // RED TAG
//    } 
//    else {
//      blanche[index]  = 0;
//    }
  }
  ////////////////////////////////////////////////////////////////////

    // get all the totals, figure out who has the biggest total (non-zero) and send THAT one as a 1
    // everyone else is a zero

    // get the totals -- store tehm for sorting 
    int[] doll_totals = new int[4];

    doll_totals[CLARA]    = getTotal(clara);      // note CLARA
    doll_totals[RHONDA]   = getTotal(rhonda);     //      RHONDA
    //doll_totals[BLANCHE]  = getTotal(blanche);   //      BLANCHE
    doll_totals[GRACE]    = getTotal(grace);      //      GRACE are ints defined at top of code.


    // compare the totals -- i put the values in an array -- makes it cleaner (to me)
    // strategy is :: look at each dolls total and if a new doll has a bigger total, it 
    // becomes doll_with_largest_total -- remember her

    int largest_total = 1;
    int doll_with_largest_total= -1;

    for (int i = 0; i < 4; i ++ ) {

      if (doll_totals[i] > largest_total) {  // look at each total -- first Clara, tehn RHonda
        doll_with_largest_total = i;     // store that doll that is winning
        largest_total = doll_totals[ doll_with_largest_total ];  // reset the largest count to the new winning total
      }
    }

    // we should now have the doll with largest total
    // that doll will send a 1 all others will send a 0.

    // SENDING THE NAME OF THE TAG TO DANTE'S XBEE/ARDUINO

    xbeePacket.clear(); // start fresh

    // we need to send 4 int (1 for each doll).
    // the doll with largest total sends a 1 -- the others send a 0.

    for (int i= 0; i < 4; i ++ ) {
      // the doll ahve a positive total or bigger than some number
      // tehn write a 1 

      if (    doll_totals[i] > 2 ) {
        // if ( i == doll_with_largest_total ) {

        xbeePacket.add( 1 );
      } 
      else {
        // esle write a zero 

        xbeePacket.add( 0 );
      }
    }

    //xbeePacket.add( rhonda ); 

    //xbeePacket.add( grace ); 

    //xbeePacket.add( blanche ); 

    // get the whole package (it’s a String) 
    String myPackage = xbeePacket.getPackage();
    myServer.write(myPackage);
    xbeePort.write(myPackage);

    println(myPackage);

    cnt++; // increase count here
  }  // end the if you have a new tag -- so we only send if there is a tag.
//}
////////////////////////////////////////////////////////////////////
// GET TOTAL FUNCTION
int getTotal(int[] d) {
  int sum =0;
  for (int i = 0; i < 10; i ++ ) {
    sum +=d[i];
  }
  return sum;
}// end getTotal

