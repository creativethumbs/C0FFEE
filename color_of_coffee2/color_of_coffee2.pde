/* Credit to Golan Levin for the recording option */

int nFrames = 10;
int nElapsedFrames = 0;
int quadCount = 30;
Quad[] quads = new Quad[quadCount];
boolean bRecording;
PFont font;

void setup() 
{
  frameRate(10);
  font = loadFont("Minecraftia-40.vlw");
  textFont(font, 40);
  smooth();
  noStroke();
  size(1500, 1500);
  float f = -(float) quadCount/2;

  for (int i = 0; i < quadCount; i++) { 
    quads[i] = new Quad(f);
    f++;
  }
}

void draw() {
  if (nElapsedFrames < nFrames) {
    translate(width/2, height/2); 
    background(#A32121);

    for (int i = 0; i < quadCount; i++) { 
      Quad quad = (Quad) quads[i];
      quad.display();
    }
    fill(255);
    text("#C0FFEE", -110, 480);

    saveFrame("c0ffee-###.png");
    
    nElapsedFrames++;
  }
  else {
    noLoop();
    exit();
  }
}

