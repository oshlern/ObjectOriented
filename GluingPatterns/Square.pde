 public class Square extends GraphicObject {

    Square(float x, float y) {
      super(x, y);
    }

    Square(Vertex v) {
        super(v);
    }

    Square(Polygon polygon) {
      super(polygon);
    }

    /* Draw self on the canvas.  */
    public void display() {
        fill(this.FILL_COLOR);
        stroke(this.FILL_COLOR);
        rect(this.pos_vel.v.x, this.pos_vel.v.y, this.SIZE, this.SIZE);
    }

}