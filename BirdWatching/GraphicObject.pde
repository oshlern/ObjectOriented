abstract class GraphicObject {
  public float x;
  public float y;
  protected float xSpeed;
  protected final float minXSpeed;
  protected final float maxXSpeed;
  protected float ySpeed;
  protected final float minYSpeed;
  protected final float maxYSpeed;
  public final float size;
  public final color fillColor;
  
  GraphicObject(float minXSpeed, float maxXSpeed, float minYSpeed, float maxYSpeed, float size) {
    this.minXSpeed = minXSpeed;
    this.maxXSpeed = maxXSpeed;
    this.minYSpeed = minYSpeed;
    this.maxYSpeed = maxYSpeed;
    this.x = random(0, width);
    this.y = random(0, height);
    this.xSpeed = random(this.minXSpeed, this.maxXSpeed);
    this.ySpeed = random(this.minYSpeed, this.maxYSpeed);
    this.fillColor = color(random(0,255), random(0,255), random(0,255));
    this.size = size;
  }
  
  //GraphicObject() {
  //  this.x = random(0, width);
  //  this.y = random(0, height);
  //  this.xSpeed = random(this.minXSpeed, this.maxXSpeed);
  //  this.ySpeed = random(this.minYSpeed, this.maxYSpeed);
  //  this.fillColor = color(random(0,255), random(0,255), random(0,255));
  //}
  
  abstract void display();

  void move() {
    this.extraMove();
    this.ySpeed = min(this.maxYSpeed, max(this.minYSpeed, this.ySpeed));
    this.xSpeed = min(this.maxXSpeed, max(this.minXSpeed, this.xSpeed));
    this.x += this.xSpeed;
    this.y += this.ySpeed;
  }
  
  // extraMove is a hook function with no arguments that is called at the beginning of move.
  // It is optionally overwritten in child classes of GraphicObject
  void extraMove() {}

  // if off the side of the screen, reverse speed
  void reverseX() {
    if ((this.x < -this.size  && this.xSpeed < 0) || (this.x > width && this.xSpeed > 0)) {
      this.xSpeed = -this.xSpeed;
    }
  }
  void reverseY() {
    if ((this.y < -this.size  && this.ySpeed < 0) || (this.y > height && this.ySpeed > 0 )) {
      this.ySpeed = -this.ySpeed;
    }
  }
  
  // if off the side of the screen,
  // move to just off the other side of the screen
  void tesselateX() {
    if (this.x > width + this.size && this.xSpeed > 0) {
      this.x = -this.size;
    } else if (this.x < -this.size && this.xSpeed < 0) {
      this.x = width + this.size;
    }
  }
   void tesselateY() {
    if (this.y > height + this.size && this.ySpeed > 0) {
      this.y = -this.size;
    } else if (this.y < -this.size && this.ySpeed < 0) {
      this.y = height + this.size;
    }
  }
}