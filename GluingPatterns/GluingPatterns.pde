Surface display;
Polygon[] polygons;

/* Add a new shape */
void addShape() {
    GraphicObject object;
    int index = (int)Math.floor(random(0, polygons.length));
    Polygon p = polygons[index];
    Vertex v = p.generatePointInside();
    if (random(0, 1) < 0.3) {
        object = new Line(v);
    } else if (random(0, 1) < 0.43) {
        object = new Circle(v);
    } else  if (random(0, 1) < 0.85) {
        object = new Square(v);
    } else {
        object = new SoaringBird(v);
    }
    object.polygon = p;
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
    size(1000, 600);
    background(255, 255, 255);
    Polygon p1 = new Polygon(new Vertex[] {new Vertex(100., 100.), new Vertex(100., 200.), new Vertex(200., 200.), new Vertex(200., 100.)});
    Polygon p2 = new Polygon(new Vertex[] {new Vertex(250., 250.), new Vertex(250., 350.), new Vertex(350., 350.), new Vertex(350., 250.)});
    Polygon p3 = new Polygon(new Vertex[] {new Vertex(400., 50.), new Vertex(400., 350.), new Vertex(600., 350.), new Vertex(600., 50.)});
    polygons = new Polygon[] {p1, p2, p3};
    ArrayList<EdgeIdentification> ids = new ArrayList<EdgeIdentification>();
    ids.add(new EdgeIdentification(p1.edges[0], p1.edges[2], true));
    ids.add(new EdgeIdentification(p2.edges[0], p2.edges[2], false));
    ids.add(new EdgeIdentification(p1.edges[1], p2.edges[3], false));
    ids.add(new EdgeIdentification(p1.edges[1], p3.edges[3], false));
    ids.add(new EdgeIdentification(p3.edges[1], p3.edges[2], false));
    display = new Surface(polygons, ids);
    for (int i=0;i<5;i++){
        addShape();
    }
    background(255, 255, 255);
    display.iterate();
}

/* 
  Redraw the background, have all game objects update
  and redraw. Processing will automatically call this
  method at a set refresh rate.
*/
void draw() {
    background(255, 255, 255);
    display.iterate();
    delay(50);
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