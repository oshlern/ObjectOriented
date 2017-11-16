public class Circle extends GraphicObject {
    /* Draw self on the canvas. */
    public void display() {
        fill(this.fillColor);
        stroke(this.fillColor);
        ellipse(this.pos.x, this.pos.y, this.size, this.size);
    }
}