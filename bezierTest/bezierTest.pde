
float x=250, y=250; // moving point position
float vx=0,vy=0;    // speed of point

int prevMillis=0;  // time keeping

void setup() {
  size(900, 650);
}

void draw() {
  // background with transparency
  noStroke();
  fill(color(255,255,255,22));
  rect(0,0,width,height);

  // curve drawing
  strokeWeight(8);
  strokeCap(ROUND);
  stroke(color(10,0,10,42));
  bezier(x,y,mouseX,mouseY,x/2,y/3,4/3*x,4/3*y);

  // time keeping
  float dt = ((float)(millis() - prevMillis))/1000;
  prevMillis = millis();
    
  // update positions towards target using 'physics' model
  float tx = mouseX; // target
  float ty = mouseY;
  float a = dist(tx,ty,x,y); // acceleration
  vx += a/100 * (tx-x) *dt;
  vy += a/100 * (ty-y) *dt;
  x += vx * dt;
  y += vy * dt;
  //println( dt + " " + vx + " " + vy); // debugging
 
}

