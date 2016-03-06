import ddf.minim.*;
import glitchP5.*;





SoundRespond mySoundRespond;

GlitchP5 glitchP5; 

TunnelCamera cam; 

int gridMaxX = 20; //Dimensions
float tileSize = 20;

ArrayList<Box> boxes;

AudioInput in;

float dimension; 




void setup( ) {
  size(960, 540, P3D);
  mySoundRespond = new SoundRespond(this);


  boxes = new ArrayList();
  for (int x=0; x<10; x++) {
    for (int y=0; y<10; y++) {
      for (int z=0; z<10; z++) {
        boxes.add(new Box(x-5, y-5, z-5));
      }
    }
  }
  cam = new TunnelCamera(new PVector((gridMaxX*tileSize)/2, 200, -200));
  in = minim.getLineIn(Minim.STEREO, 512); 

  glitchP5 = new GlitchP5(this);
}


void draw() {
  background(255, 50);
  cam.setCamHeight(mouseY);
  cam.update();
  noStroke();
  lights();
  translate(width/2, height/2);

  //if (key == 'w') {
  //  rotateY(frameCount*0.005);
  //}

  for (Box box : boxes) {
    box.draw();
    box.update();
  }

  dimension = mySoundRespond.adding (2.0);

  glitchP5.run();

  glitchP5.glitch(width/2, height/2, height, width, 200, 10, 20, dimension, 10, 20);
}

void keyPressed() {
  if (key=='e') {
    for (Box box : boxes) {
      box.change(0, 0.2);
    }
  } else if (key=='r') {
    for (Box box : boxes) {
      box.change(random(4, 20), 0.01);
    }
  }
}


void stop() {
  in.close();
  minim.stop();
  super.stop();
}