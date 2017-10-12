class FallingFeather extends GraphicObject{
  

  public FallingFeather() {
    super(-1.0, 1.0, 0.5, 1.5, 5.0);
  }

  void display() {
    fill(this.fillColor);
    rect(this.x, this.y, this.size*2, this.size);
  }
  
  void extraMove() {
     //about 5% of the time,
     //or if going off the left or right of the screen,
     //reverse x direction
    if (random(0, 1) > 0.95) {
      this.xSpeed = -this.xSpeed;
    }
    this.tesselateY();
    this.reverseX();
  }
}