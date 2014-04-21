
class Shape {

  color col;
  int  x, y, w, h;
  int type;

  Shape(int colorIndex) {
    int numCols = aColors.length;
    float m = maxColorDev;
    col = aColors[colorIndex] + color(random(-m, m), random(-m, m), random(-m, m));    
    x= int(random(minimumSpacing, width-minimumSpacing));
    y= int(random(minimumSpacing, height-minimumSpacing));

    // there are 3 different types of shapes
    type = int(round(random(0.25, 2.5)));
    switch(type) {
    case 0:
      w= int(random(40, 42));
      h=w;
      break;
    case 1:
      w= int(random(60, 200));
      h= int(random(20, 30));
      break;
    case 2:
      w= int(random(20, 30));
      h= int(random(60, 200));
      break;
    }
  }

  void draw() {
    noStroke();
    fill(col);
    rect(x, y, w, h);
  }

  boolean isOverlap(ArrayList<Shape> others) {
    // use extra 'empty' area around shape based on minimumSpacing
    int s = (int)round(minimumSpacing/2);
    for (int i=0; i < others.size(); i++) {
      if (this.intersects(others.get(i),s))
        return true;
    }
    return false;
  }

  boolean intersects(Shape o, int extraSpacing) {
    int tw = this.w + extraSpacing*2;
    int th = this.h + extraSpacing*2;
    int ow = o.w + extraSpacing*2;
    int oh = o.h + extraSpacing*2;
    if (ow <= 0 || oh <= 0 || tw <= 0 || th <= 0) {
      return false;
    }
    int tx = this.x - extraSpacing;
    int ty = this.y - extraSpacing;
    int rx = o.x - extraSpacing;
    int ry = o.y - extraSpacing;
    ow += rx;
    oh += ry;
    tw += tx;
    th += ty;
    return ((ow < rx || ow > tx) &&
      (oh < ry || oh > ty) &&
      (tw < tx || tw > rx) &&
      (th < ty || th > ry));
  }

  boolean isOffScreen() {
    return (x<minimumSpacing) || (y<minimumSpacing) ||
      ((x+w)>(width-minimumSpacing)) || ((y+h)>(height-minimumSpacing)) ;
  }
}

