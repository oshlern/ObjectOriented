abstract class GraphicObject {

    public Position pos;
    public Position vel;
    public final float SIZE;
    protected final color FILL_COLOR;
    public Polygon polygon; // The polygon which the object is in.

    GraphicObject(Position pos, Position vel, float size, color fill_color) {
        this.pos = pos;
        this.vel = vel;
        this.FILL_COLOR = fill_color;
        this.SIZE = size;
    }

    GraphicObject(Position pos, Position vel, float size) {
        this.pos = pos;
        this.vel = vel;
        this.FILL_COLOR = color(random(0, 255), random(0, 255), random(0, 255));
        this.SIZE = size;
    }

    GraphicObject(Position pos) {
         this.pos = pos;
         this.vel = new Position(random(-3., 3.), random(-3., 3.), random(-PI/3, PI/3));
         this.FILL_COLOR = color(random(0, 255), random(0, 255), random(0, 255));
         this.SIZE = random(5., 25.);
    }

    GraphicObject(float x, float y) {
        this.pos = new Position(x, y, random(0, 2*PI));
        this.vel = new Position(random(-3., 3.), random(-3., 3.), random(-PI/10, PI/10));
        this.FILL_COLOR = color(random(0, 255), random(0, 255), random(0, 255));
        this.SIZE = random(5., 25.);
    }

    GraphicObject() {
        this.pos = new Position(random(0., width), random(0., height), random(0, 2*PI));
        this.vel = new Position(random(-3., 3.), random(-3., 3.), random(-PI/10, PI/10));
        this.FILL_COLOR = color(random(0, 255), random(0, 255), random(0, 255));
        this.SIZE = random(5., 25.);
    }

    abstract public void display();

}