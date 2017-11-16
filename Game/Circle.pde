public class Circle extends GraphicObject {

    Circle(float x, float y) {
      super(x, y);
    }

    Circle() {
      super();
    }

    /* Draw self on the canvas. */
    public void display() {
        fill(this.FILL_COLOR);
        stroke(this.FILL_COLOR);
        ellipse(this.pos.x, this.pos.y, this.SIZE, this.SIZE);
    }
}