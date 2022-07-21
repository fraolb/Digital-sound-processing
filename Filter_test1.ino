#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <SerialFlash.h>
#include <Bounce.h>

// GUItool: begin automatically generated code
AudioInputI2S            i2s1;           //xy=99,60
AudioFilterBiquad        biquad1;        //xy=257,60
AudioOutputI2S           i2s2;           //xy=416,60
AudioConnection          patchCord1(i2s1, 0, biquad1, 0);
AudioConnection          patchCord2(biquad1, 0, i2s2, 0);
AudioConnection          patchCord3(biquad1, 0, i2s2, 1);
AudioControlSGTL5000     sgtl5000_1;     //xy=305,132
// GUItool: end automatically generated code
Bounce button0 = Bounce(0, 15);
Bounce button2 = Bounce(2, 15); 

//const int myInput = AUDIO_INPUT_LINEIN;
//const int myInput = AUDIO_INPUT_MIC;

void setup() {
  AudioMemory(12);

  sgtl5000_1.enable();  // Enable the audio shield
//  sgtl5000_1.inputSelect(myInput);
  sgtl5000_1.volume(0.5);
pinMode(0, INPUT_PULLUP);
  pinMode(2, INPUT_PULLUP);
    delay(1000);
  // Butterworth filter, 12 db/octave
 // biquad1.setLowpass(0, 500, 0.707);

  // Linkwitz-Riley filter, 48 dB/octave
  //biquad1.setLowpass(0, 800, 0.54);
  //biquad1.setLowpass(1, 800, 1.3);
  //biquad1.setLowpass(2, 800, 0.54);
  //biquad1.setLowpass(3, 800, 1.3);
}


unsigned long updatePeriod_millis = 100; //how many milliseconds between updating gain reading?
unsigned long lastUpdate_millis = 0;
unsigned long curTime_millis = 0;
int prev_gain_dB = 0;

void loop() {
   //has enough time passed to try updating the GUI?
  curTime_millis = millis(); //what time is it right now
  if (curTime_millis < lastUpdate_millis) lastUpdate_millis = 0;
  if ((curTime_millis - lastUpdate_millis) > updatePeriod_millis) {
    
    //read potentiometer
//    int knob = analogRead(A2);
//  float vol = (float)knob / 1280.0;
//  sgtl5000_1.volume(vol);

  // read pushbuttons
  button0.update();
  if (button0.fallingEdge()) {
   // biquad1.stop();
    biquad1.setLowpass(0, 500, 0.707);
    
  }
  button2.update();
  if (button2.fallingEdge()) {
   // biquad1.stop();
    biquad1.setHighpass(1,2000, 0.707);
  }
    //compute desired digital gain
    const float min_gain_dB = -20.0, max_gain_dB = 40.0; //set desired gain range
 //   float gain_dB = min_gain_dB + (max_gain_dB - min_gain_dB)*val; //computed desired gain value in dB

 
    lastUpdate_millis = curTime_millis; //hold on to this time value
  } // end if



}
