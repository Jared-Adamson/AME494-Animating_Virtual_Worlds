/*
 * it is recommended to take a look at oscP5plug for an
 * alternative and more convenient way to parse messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;

int rigidBodyID;
float x, y, z;

int MAX_RIGIDBODIES = 10;
float[] scrX = new float[MAX_RIGIDBODIES];
float[] scrY = new float[MAX_RIGIDBODIES];
float[] r = new float[MAX_RIGIDBODIES];

float[] aryX = new float[MAX_RIGIDBODIES];
float[] aryY = new float[MAX_RIGIDBODIES];
float[] aryZ = new float[MAX_RIGIDBODIES];


void setup() {
size(400,400);
frameRate(30);
background(0);
/* start oscP5, listening for incoming messages at port 9999 */
oscP5 = new OscP5(this,9995);
}

void draw() {      
  
  
 

print(rigidBodyID, x, y, z);

}

void oscEvent(OscMessage theOscMessage) {
/* check if theOscMessage has the address pattern we are looking for. */
  
if(theOscMessage.checkAddrPattern("/rigidbody")==true) {
/* check if the typetag is the right one. */
if(theOscMessage.checkTypetag("ifff")) {
  /* parse theOscMessage and extract the values from the osc message arguments. */
  rigidBodyID = theOscMessage.get(0).intValue();  
  x = theOscMessage.get(1).floatValue();
  y = theOscMessage.get(2).floatValue();
  z = theOscMessage.get(3).floatValue();      
 //    print("### received an osc message /rigidbody with typetag ifff.");
     println(" values: "+rigidBodyID+", "+x+", "+y+", "+z);

     float r_scrX = ( x / 4000.0 + 0.5 ) * width;
     float r_scrY = ( z / 4000.0 + 0.5 ) * height;
     float r_r = y / 1000.0 * 10 + 20;
    
     if ( rigidBodyID <= MAX_RIGIDBODIES ) {
       scrX[rigidBodyID-1] = r_scrX;
       scrY[rigidBodyID-1] = r_scrY;
       r[rigidBodyID-1] = r_r;
     }
  
  if ( rigidBodyID <= MAX_RIGIDBODIES ) {
      aryX[rigidBodyID-1] = x;
      aryY[rigidBodyID-1] = y;
      aryZ[rigidBodyID-1] = z;
  } 
      
      
    return;
    }  
  } 
  println("### received an osc message. with address pattern "+theOscMessage.addrPattern());
}
