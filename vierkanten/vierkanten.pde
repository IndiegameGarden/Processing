
int jumpStep = 8; // max y jump step
int numberOfColors = 255 * 255 * 255; 
int sz = 60; // width of square
int x=250;
int y=250;
float tempo=1.3;
int xdir=1;
int col;
boolean isFirstTime=true;

boolean sketchFullScreen() {
  return true;
}

void setup() {
  size(1100, 700);
}

void draw() {
  if (mousePressed || isFirstTime) {
    float colNumber = random(0, 255);
    fill(colNumber, 34, y, random(10, 45));
    stroke(x, y, colNumber, 45);
    isFirstTime=false;
  }

  sz = y/15;
  x+=xdir*tempo;
  //tempo *= random(0.99, 1.1);
  rect(x, y, sz, sz);
  rect(width-x,height-y,sz,sz);
  arc(x,y,sz,sz,x,y);
  if (x > width || x<0 ) {
    xdir = -xdir;
    //tempo = int(random(4, 14));
  }
  if (y > mouseY) {
    y -= int(random(1, jumpStep));
  }
  else {
    y += int(random(1, jumpStep));
  }
}

