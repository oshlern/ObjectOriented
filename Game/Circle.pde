public class Circle extends GraphicObject {

    Circle(float x, float y) {
      super(x, y);
    }

    Circle() {
      super();
    }

    /* Draw self on the canvas. */
    public void display() {
        fill(this.fillColor);
        stroke(this.fillColor);
        ellipse(this.pos.x, this.pos.y, this.size, this.size);
    }
}