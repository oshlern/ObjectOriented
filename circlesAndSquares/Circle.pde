public class Circle extends RegularShape {
    public Circle(float x, float y) {
        super(x, y);
        this.spin = 0.0;
    }
  
    /* Draw self on the canvas. */
    public void display() {
        fill(this.fillColor);
        stroke(0,0,0); // makes a black outline
        ellipse(this.x, this.y, this.size, this.size);
    }
}