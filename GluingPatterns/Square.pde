 public class Square extends GraphicObject {

    Square(float x, float y) {
      super(x, y);
    }

    Square() {
      super();
    }

    /* Draw self on the canvas.  */
    public void display() {
        fill(this.FILL_COLOR);
        stroke(this.FILL_COLOR);
        rect(this.pos.x, this.pos.y, this.SIZE, this.SIZE);
    }

}