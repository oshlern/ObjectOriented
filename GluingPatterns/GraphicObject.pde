abstract class GraphicObject {

    public PosVel pos_vel;
    public final float SIZE;
    protected final color FILL_COLOR;
    public Polygon polygon; // The polygon which the object is in.

    //GraphicObject(Position pos, Position vel, float size, color fill_color) {
    //    this.pos = pos;
    //    this.vel = vel;
    //    this.FILL_COLOR = fill_color;
    //    this.SIZE = size;
    //}

    GraphicObject(PosVel pos_vel, float size) {
        this.pos_vel = pos_vel;
        this.FILL_COLOR = color(random(0, 255), random(0, 255), random(0, 255));
        this.SIZE = size;
    }

    //GraphicObject(Position pos) {
    //     this.pos = pos;
    //     this.vel = new Position(random(-3., 3.), random(-3., 3.), random(-PI/3, PI/3));
    //     this.FILL_COLOR = color(random(0, 255), random(0, 255), random(0, 255));
    //     this.SIZE = random(5., 25.);
    //}

    GraphicObject(float x, float y) {
        this.pos_vel = new PosVel(x, y, random(0, 2*PI), random(-3., 3.), random(-3., 3.), random(-PI/10, PI/10));
        this.FILL_COLOR = color(random(0, 255), random(0, 255), random(0, 255));
        this.SIZE = random(5., 25.);
    }

    GraphicObject(Polygon polygon) {
        this.pos_vel = new PosVel(random(polygon.vertices[0].x+1, polygon.vertices[2].x-1), random(polygon.vertices[0].y+1, polygon.vertices[2].y-1), 
                                  random(0, 2*PI), random(-3., 3.), random(-3., 3.), random(-PI/10, PI/10));
        this.FILL_COLOR = color(random(0, 255), random(0, 255), random(0, 255));
        this.SIZE = random(5., 25.);
        this.polygon = polygon;
    }

    abstract public void display();

}