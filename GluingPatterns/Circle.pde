public class Circle extends GraphicObject {

    Circle(float x, float y) {
        super(x, y);
    }

    Circle(Vertex v) {
        super(v);
    }

    Circle(Polygon polygon) {
        super(polygon);
    }

    /* Draw self on the canvas. */
    public void display() {
        fill(this.FILL_COLOR);
        stroke(this.FILL_COLOR);
        ellipse(this.pos_vel.v.x, this.pos_vel.v.y, this.SIZE, this.SIZE);
    }

}