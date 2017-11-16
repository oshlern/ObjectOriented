public class Line extends RegularShape {
    /* Draw self on the canvas. */
    public void display() {
        float rotated_x = this.size*cos(this.angle);
        float rotated_y = this.size*sin(this.angle);
        fill(this.fillColor);
        stroke(this.fillColor);
        line(this.x - rotated_x/2, this.y - rotated_y/2, this.x + rotated_x/2, this.y + rotated_y/2);
    }
}