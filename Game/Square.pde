public class Square extends GraphicObject {

    Square(float x, float y) {
      super(x, y);
    }

    Square() {
      super();
    }

    /* Draw self on the canvas.  */
    public void display() {
        fill(this.fillColor);
        stroke(this.fillColor);
        rect(this.pos.x, this.pos.y, this.size, this.size);
    }
}