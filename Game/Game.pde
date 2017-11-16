Surface display;

/* Add a new shape at x, y. */
void addShape(float x, float y) {
    if (random(0, 1) < 2) {
        gameObjects.add(new Line(x, y));
    } else if (random(0, 1) < 0.5) {
        gameObjects.add(new Circle(x, y));
    } else {
        gameObjects.add(new Square(x, y));
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
  size(200, 200);
  display = new Torus();
  for (int i=0;i<15;i++){
     display.insertObject(new Circle());
  }
}

/* 
   Redraw the background, have all game objects update
   and redraw. Processing will automatically call this
   method at a set refresh rate.
*/
void draw() {
    //background(255, 255, 255);
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
    display.insertObject(CirclemouseX, mouseY);
}