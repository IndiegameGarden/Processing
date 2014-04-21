
int a=3;
float n=3.141592;
String txt = "processing...";

void setup() {
  println("Start");
  size(450,450);
  frameRate(30);
}

void draw() {
  n+=1.093383;
  println(txt + " " + n);
  background(n % 255);
  rect(n,n,20,20);
}

