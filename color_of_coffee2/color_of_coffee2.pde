/* Credit to Golan Levin for the recording option */

int nFramesInLoop = 160;
int nElapsedFrames;
int quadCount = 30;
Quad[] quads = new Quad[quadCount];
boolean bRecording;
PFont font;

void setup() 
{
  font = loadFont("Minecraftia-30.vlw");
  textFont(font, 20);
  smooth();
  noStroke();
  size(500, 500);
  float f = -(float) quadCount/2;

  for (int i = 0; i < quadCount; i++) { 
    quads[i] = new Quad(f);
    f++;
  }
}

void keyPressed() {
  bRecording = true;
  nElapsedFrames = 0;
}

void draw() {
  // Compute a percentage (0...1) representing where we are in the loop.
  float percentCompleteFraction = 0; 
  if (bRecording) {
    percentCompleteFraction = (float) nElapsedFrames / (float)nFramesInLoop;
  } 
  else {
    percentCompleteFraction = (float) (frameCount % nFramesInLoop) / (float)nFramesInLoop;
  }

  // Render the design, based on that percentage. 
  renderMyDesign (percentCompleteFraction);

  fill(255);
  //textSize(20);
  text("#C0FFEE", -60, 220);

  // If we're recording the output, save the frame to a file. 
  if (bRecording) {
    saveFrame("output/myname-loop-" + nf(nElapsedFrames, 4) + ".png");
    nElapsedFrames++; 
    if (nElapsedFrames >= nFramesInLoop) {
      bRecording = false;
    }
  }
}

void renderMyDesign(float percent)
{
  translate(width/2, height/2); 
  background(#A32121);

  for (int i = 0; i < quadCount; i++) { 
    Quad quad = (Quad) quads[i];
    quad.display();
  }
}

