Surface display;
Polygon[] polygons;

/* Add a new shape at x, y. */
void addShape() {
    Polygon p;
    GraphicObject object;
    if (random(0, 1) < 0.5) {
        p = polygons[0];
    } else {
        p = polygons[1];
    }
    if (random(0, 1) < 0.3) {
        object = new Line(p);
    } else if (random(0, 1) < 0.5) {
        object = new Circle(p);
    } else {
        object = new Square(p);
    }
    display.insertObject(object);
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
    background(255, 255, 255);
    Polygon p1 = new Polygon(new Vertex[] {new Vertex(100., 100.), new Vertex(100., 200.), new Vertex(200., 200.), new Vertex(200., 100.)});
    Polygon p2 = new Polygon(new Vertex[] {new Vertex(250., 250.), new Vertex(250., 350.), new Vertex(350., 350.), new Vertex(350., 250.)});
    polygons = new Polygon[] {p1, p2};
    ArrayList<EdgeIdentification> ids = new ArrayList<EdgeIdentification>();
    ids.add(new EdgeIdentification(p1.edges[0], p1.edges[2], true));
    ids.add(new EdgeIdentification(p1.edges[0], p1.edges[2], false));
    ids.add(new EdgeIdentification(p1.edges[1], p2.edges[1], false));
    ids.add(new EdgeIdentification(p1.edges[3], p2.edges[3], false));
  
    display = new Surface(polygons, ids);
    for (int i=0;i<15;i++){
        addShape();
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
        display.resetObjects();
    }
}

/* Processing will call this when the mouse is clicked */
void mouseClicked() {
    addShape();
}