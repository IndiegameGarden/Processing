//Eerst geven we aan hoe groot een blokje in het raster is
int cellSize=48;

void setup() {
  //We spelen een beetje vals door de grootte van het canvas makkelijk deelbaar maken door de grote van een vorm
  size(displayWidth, displayHeight);

  //Voor het tekenen van "nette" afbeeldingen
  smooth();

  //Een zwarte achtergrond
  background(0);
  noStroke();

  //vergeet ellipseMode niet toe te voegen 
  //http://processing.org/reference/ellipseMode_.html
  ellipseMode(CORNER);

  //Twee for loops om het raster te vullen
  for (int y=0;y<height/cellSize;y= y+1) {
    println("y " + y);
    for (int x=0;x<width/cellSize;x= x+1) {
      int shape = floor(random(2));

      //Hier doen we hetzelfde als in draw maar vervangen we mouseXArea met x en mouseYarea met y
      fill(random(255), random(255), random(255));

      if (shape ==0) {
        rect(x*cellSize, y*cellSize, cellSize, cellSize);
      } 
      else if (shape == 1) {
        ellipse(x*cellSize, y*cellSize, cellSize, cellSize);
      }
    }
  }
}

void draw() {
  //Hier rekenen we uit in welk rastervierkantje de muis uithangt
  int mouseXArea = floor(mouseX/cellSize);  
  int mouseYArea = floor(mouseY/cellSize);
  int pmouseXArea = floor(pmouseX/cellSize);  
  int pmouseYArea = floor(pmouseY/cellSize);

  int shape = floor(random(0, 10));
  if (mouseXArea != pmouseXArea || mouseYArea != pmouseYArea) {

    //Nu tekenen we er dus altijd een zwart vakje achter, zodat cirkels die over een vierkant heen
    //vallen niet nog het vierkant er achter laten zien
    fill(0);
    rect(mouseXArea*cellSize, mouseYArea*cellSize, cellSize, cellSize);

    fill(random(255), random(255), random(255));

    //shape =8; // debug only
    if (shape ==0) {
      rect(mouseXArea*cellSize, mouseYArea*cellSize, cellSize, cellSize);
    } 
    else if (shape == 1) {
      ellipse(mouseXArea*cellSize, mouseYArea*cellSize, cellSize, cellSize);
    }
    else if (shape == 2) {
      arc((mouseXArea-1)*cellSize, (mouseYArea-1)*cellSize, cellSize*2, cellSize*2, 0, HALF_PI);
    }
    else if (shape == 3) {
      arc((mouseXArea-1)*cellSize, (mouseYArea+0)*cellSize, cellSize*2, cellSize*2, -HALF_PI, 0);
    }
    else if (shape == 4) {
      arc((mouseXArea)*cellSize, (mouseYArea)*cellSize, cellSize*2, cellSize*2, -PI, -HALF_PI);
    }
    else if (shape == 5) {
      arc((mouseXArea)*cellSize, (mouseYArea-1)*cellSize, cellSize*2, cellSize*2, HALF_PI, PI);
    }
    else if (shape == 6) {
      arc((mouseXArea+0.5)*cellSize, (mouseYArea)*cellSize, cellSize, cellSize, HALF_PI, PI+HALF_PI);
    }
    else if (shape == 7) {
      arc((mouseXArea-0.5)*cellSize, (mouseYArea)*cellSize, cellSize, cellSize, PI+HALF_PI, TWO_PI+HALF_PI);
    }
    else if (shape == 8) {
      arc((mouseXArea)*cellSize, (mouseYArea-0.5)*cellSize, cellSize, cellSize, 0, PI);
    }
    else if (shape == 9) {
      arc((mouseXArea)*cellSize, (mouseYArea+0.5)*cellSize, cellSize, cellSize, PI, TWO_PI);
    }
  }
}

