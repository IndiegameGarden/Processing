PImage b;
PImage source;
int levels = 1;
boolean doDraw = true;

void setup() {
  colorMode(RGB, 255);
  b = loadImage("portrait.jpg");
  size(b.width, b.height);
}

void draw () {
  if (doDraw) {
    doDraw = false;
    background(255);
    image(b, -b.width/2.0, 0); 
    source = b.get();
    println("dither: levels="+levels);

    float lNorm = 255.0/levels;

    // FS Kernal
    float d1 = 7.0 / 16.0;
    float d2 = 3.0 / 16.0;
    float d3 = 5.0 / 16.0;
    float d4 = 1.0 / 16.0;

    int c, nc, lc, rc;
    float r, g, b;
    float nr, ng, nb;
    float er, eg, eb;
    float lr, lg, lb;
    int x = 0, y = 0;

    // Ordered Dithering Implementation
    for (y = 0; y < source.height; y++) {
      for (x = 0; x < source.width; x++) {
        // Retrieve current RGB value
        c = source.get(x, y);
        r = (c >> 16) & 0xFF;
        g = (c >> 8) & 0xFF;
        b = c & 0xFF;

        // Normalize and scale to number of levels
        // basically a cheap but crappy form of color quantization
        nr = round((r/255.0) * levels) * lNorm;
        ng = round((g/255.0) * levels) * lNorm;
        nb = round((b/255.0) * levels) * lNorm;

        // Set the current pixel
        //nc = color(nr, ng, nb); // color - original FS
        nc = color( round(((nr+ng+nb)/3.0)/255.0 * levels) *lNorm ); // to grayscale
        source.set(x, y, nc);

        // Quantization Error
        er = r-nr;
        eg = g-ng;
        eb = b-nb;

        // Apply the kernel
        // +1, 0
        lc = source.get(x + 1, y);
        lr = (lc >> 16 & 0xFF) + d1 * er;
        lg = (lc >> 8 & 0xFF) + d1 * eg;
        lb = (lc & 0xFF) + d1 * eb;
        source.set(x + 1, y, color(lr, lg, lb));

        // -1, +1
        lc = source.get(x - 1, y + 1);
        lr = (lc >> 16 & 0xFF) + (d2*er);
        lg = (lc >> 8 & 0xFF) + (d2*eg);
        lb = (lc & 0xFF) + (d2*eb);
        source.set(x - 1, y + 1, color(lr, lg, lb));

        // 0, +1
        lc = source.get(x, y + 1);
        lr = (lc >> 16 & 0xFF) + (d3*er);
        lg = (lc >> 8 & 0xFF) + (d3*eg);
        lb = (lc & 0xFF) + (d3*eb);
        source.set(x, y + 1, color(lr, lg, lb));

        // +1, +1
        lc = source.get(x+1, y+1);
        lr = (lc >> 16 & 0xFF) + (d4*er);
        lg = (lc >> 8 & 0xFF) + (d4*eg);
        lb = (lc & 0xFF) + (d4*eb);
        source.set(x+1, y+1, color(lr, lg, lb));
      }
    }
    //image(source, 0, 0);
    blend(source, 0, 0, source.width, source.height, 0, 0, source.width, source.height, DARKEST);
  }
} 

void mouseClicked() {
  if (mouseButton == LEFT)
    levels++;
  if (mouseButton == RIGHT)
    levels--;  
  doDraw=true;
}

