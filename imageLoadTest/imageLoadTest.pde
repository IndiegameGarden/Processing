
/* @pjs preload="arginino.png"; */

float dx=100;
float dy=100;

void setup() {
  size(1024,2000);
  background(255);
  drawIt();
}

void drawIt() {
  PImage img;
  img = loadImage("arginino.png");
  for (int x=0; x < 10; x++) {
    for (int y=0; y< 8; y++) {
      image(img, x*dx, y*dy);
    }
  }
}

void draw() {
}

void mouseClicked() {
  int x = floor(mouseX/dx);
  int y = floor(mouseY/dy);
  println("click ("+x+","+y+")");
  //window.open("games/Quest for the Pixel Princess XIV.exe","_self");
  window.open("games/Quest for the Pixel Princess XIV.exe");
}

