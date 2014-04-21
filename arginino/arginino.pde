
float amountOfSquaresWidth =23.0;
float squareWidth;
float amountOfSquaresHeight =17.0;
float squareHeight;
float shrinkFactor = 0.5;
float topleftOffset = 5;

void setup() {
  size(710, 500);
  squareWidth = width/amountOfSquaresWidth;
  squareHeight = height/amountOfSquaresHeight;
  ellipseMode(CORNER);
  colorMode(HSB, 100);
  background(97);
  noStroke();
  drawIt();
}

void draw() {
}

void keyPressed() {
  drawIt();
}

void mouseClicked() {
  drawIt();
}

void drawIt() {
  background(97);
  for (int y=0;y<amountOfSquaresHeight;y++) {  
    for (int x=0;x<amountOfSquaresWidth;x++) {
      // half of the time, choose Hue in range 0-8, half of the time Hue is in 0-100 range.
      // to get more red/brown.
      float r=8;
      if( random(0,1) > 0.5)
        r = 100;
      fill(random(0, r), random(50, 80), random(30, 99));
      ellipse(topleftOffset+(x*squareWidth), topleftOffset+(y*squareHeight), squareWidth * shrinkFactor, squareHeight * shrinkFactor);
    }
  }
}

