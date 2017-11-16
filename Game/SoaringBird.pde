class SoaringBird extends GraphicObject {

  SoaringBird() {
    super(new Position(random(0, width), random(height/2, height), 0.0), new Position(random(3.0, 5.0), 0.0, 0.0), 30.0);
  }

  void display() {
    fill(this.FILL_COLOR);
    ellipse(this.pos.x, this.pos.y, this.SIZE*2, this.SIZE);
  }
}