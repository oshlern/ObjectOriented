Surface display;

Vertex[] vs1 = {new Vertex(100., 100.), new Vertex(100., 200.), new Vertex(200., 200.), new Vertex(200., 100.)};
Vertex[] vs2 = {new Vertex(250., 250.), new Vertex(250., 350.), new Vertex(350., 350.), new Vertex(350., 250.)};


/* Add a new shape at x, y. */
void addShape(float x, float y) {
    if (random(0, 1) < 0.3) {
        display.insertObject(new Line(x, y));
    } else if (random(0, 1) < 0.5) {
        display.insertObject(new Circle(x, y));
    } else {
        display.insertObject(new Square(x, y));
    }
}

/*
  Collisions of lines
  Conservation of energy: mgh + 1/2mv^2 + 1/2mw^2
*/
/* 
  Processing will automatically call this once when the
  program first starts running.
*/
void setup() {
  size(500, 500);
  display = new RP2();
  for (int i=0;i<15;i++){
     display.insertObject(new Circle());
     display.insertObject(new Line());
  }
}

/* 
  Redraw the background, have all game objects update
  and redraw. Processing will automatically call this
  method at a set refresh rate.
*/
void draw() {
    background(255, 255, 255);
    display.iterate();
}

/* Processing will call this when a key is pressed. */
void keyPressed() {
    if (key == 'r') {
        display.reset();
    }
}

/* Processing will call this when the mouse is clicked */
void mouseClicked() {
    addShape(mouseX, mouseY);
}