public class Line extends GraphicObject {

    Line(float x, float y) {
        super(x, y);
    }

    Line() {
        super();
    }

    /* Draw self on the canvas. */
    public void display() {
        float rotated_x = this.SIZE*cos(this.pos.theta);
        float rotated_y = this.SIZE*sin(this.pos.theta);
        fill(this.FILL_COLOR);
        stroke(this.FILL_COLOR);
        line(this.pos.x - rotated_x/2, this.pos.y - rotated_y/2,
             this.pos.x + rotated_x/2, this.pos.y + rotated_y/2);
    }

}