class SoaringBird extends GraphicObject{

  SoaringBird() {
    super(1.0, 3.0, 0.0, 0.0, 30.0);
  }
  
  void display() {
    fill(this.fillColor);
    ellipse(this.x, this.y, this.size*2, this.size);
  }
  
  void extraMove() {
    this.tesselateX();
  }
}