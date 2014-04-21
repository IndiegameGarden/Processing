
// Theo van Doesburg Composition VII look alike

// settings to play with!
int numShapes=28;  // about 28/29 in the original
int numShapesPerColor;
boolean isCheckOverlaps = true;  // true in the original
boolean isCheckForOffScreen = true; // true in the original
float  minimumSpacing = 10;  // min space between shapes (if isCheckOverlaps == true)
float  maxColorDev = 2;  //
// the colors to use
color[] aColors = new color[] { 
  color(154, 46, 34), color(38, 55, 107), 
  color(232, 229, 212), color(208, 180, 96)
};
int currentWorkNumber = 0; // to explore the space of random works/paintings

// vars
ArrayList<Shape> shapesList = new ArrayList<Shape>();

void setup() {
  size(600, 600);
  //size(displayWidth,displayHeight);
  float sz = window.innerWidth * 0.9;
  float sz2 =window.innerHeight * 0.9;
  if (sz2 < sz) 
    sz=sz2; 
  //size( sz, sz);
  int numColors = aColors.length;
  numShapesPerColor = numShapes/numColors;
  createNew(currentWorkNumber);
}

void draw() {
  drawIt();
}

void mouseClicked() {
  if (mouseButton == LEFT)
    currentWorkNumber++;
  else
    currentWorkNumber--;
  createNew(currentWorkNumber);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) { 
      currentWorkNumber--;
    }
    else
      currentWorkNumber++;
  }
  else
    currentWorkNumber++;
  createNew(currentWorkNumber);
}

void drawIt() {
  background(16, 15, 23);
  fill(16, 15, 23);
  rect(0, 0, width, height);
  for (int i=0; i < shapesList.size(); i++) {
    shapesList.get(i).draw();
  }
}

void createNew(int workNumber) {
  randomSeed(workNumber);
  //println("Composition VII." + workNumber);
  int colorIndex = 0;
  int colorCounter = 0;
  shapesList.clear();
  for (int i=0; i < numShapes; i++) {
    boolean isOk;
    Shape s;
    // re-create shape again if it overlaps or is off-screen
    do {
      isOk = true;
      s = new Shape(colorIndex);
      // check if collides with existing ones
      if (isCheckOverlaps && s.isOverlap(shapesList))
        isOk = false;
      if (isCheckForOffScreen && s.isOffScreen())
        isOk = false;
      if (isOk) {
        colorCounter++;
        if (colorCounter >= numShapesPerColor) {
          colorCounter = 0;
          colorIndex++;
        }
      }
    }
    while (!isOk);
    shapesList.add(s);
  }
}

