public class Line extends GraphicObject {

    Line(float x, float y) {
        super(x, y);
    }

    Line(Polygon polygon) {
        super(polygon);
    }

    /* Draw self on the canvas. */
    public void display() {
        float rotated_x = this.SIZE*cos(this.pos_vel.theta);
        float rotated_y = this.SIZE*sin(this.pos_vel.theta);
        fill(this.FILL_COLOR);
        stroke(this.FILL_COLOR);
        line(this.pos_vel.v.x - rotated_x/2, this.pos_vel.v.y - rotated_y/2,
             this.pos_vel.v.x + rotated_x/2, this.pos_vel.v.y + rotated_y/2);
    }

}