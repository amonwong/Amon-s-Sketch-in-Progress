  import ddf.minim.*;
  private Minim minim; 
  private AudioInput input;
  
class SoundRespond {

  //import ddf.minim.*;
  //private Minim minim; 
  //private AudioInput input;


  SoundRespond(PApplet myApplet) {

    minim = new Minim (myApplet);
    input = minim.getLineIn (Minim.STEREO, 512);
  } 

  float adding (float _upperRange) {
    float volumeValue = input.mix.level ()*250;
    volumeValue = constrain(volumeValue, 0, 100); 

    volumeValue = map(volumeValue, 0, 100, 0, _upperRange); 
    return volumeValue;
  }
}