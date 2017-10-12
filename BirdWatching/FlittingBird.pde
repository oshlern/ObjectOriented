class FlittingBird extends GraphicObject {

  public FlittingBird() {
    super(2.0, 5.0, -1.0, 1.0, 15.0);
  }

  void display() {
    fill(this.fillColor);
    ellipse(this.x, this.y, this.size*2, this.size);
  }

  void extraMove() {
    // about 20% of the time, change speed a bit
    if (random(0,1) > 0.8) {
      this.ySpeed += random(-0.5, 0.5);
      this.xSpeed += random(-0.5, 0.5);
    }
    this.tesselateX();
    this.reverseY();
  }
}