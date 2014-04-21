void setup() {
  size(400, 400);
  float w = 70;
  rectMode(CORNERS);
  rect(width/2-w/2, height/2-w/2, w, w);
  ellipseMode(CORNER);  
  ellipse(width/2, height/2, w, w);
}

