abstract class GraphicObject {
  public float x;
  public float y;
  public float theta;
  protected float xSpeed;
  protected final float minXSpeed;
  protected final float maxXSpeed;
  protected float ySpeed;
  protected final float minYSpeed;
  protected final float maxYSpeed;
  protected float thetaSpeed;
  protected final float minThetaSpeed;
  protected final float maxThetaSpeed;
  public final float size;
  public color fillColor;
  public final color initColor;
  public final color finColor;
  
  GraphicObject(float minXSpeed, float maxXSpeed, float minYSpeed,
                  float maxYSpeed, float minThetaSpeed, float maxThetaSpeed,
                  float size, color initColor, color finColor
                ) {
    this.minXSpeed = minXSpeed;
    this.maxXSpeed = maxXSpeed;
    this.minYSpeed = minYSpeed;
    this.maxYSpeed = maxYSpeed;
    this.minThetaSpeed = minThetaSpeed;
    this.maxThetaSpeed = maxThetaSpeed;
    this.x = random(0, width);
    this.y = random(0, height);
    this.theta = random(0, 2*PI);
    this.xSpeed = random(this.minXSpeed, this.maxXSpeed);
    this.ySpeed = random(this.minYSpeed, this.maxYSpeed);
    this.thetaSpeed = random(this.minThetaSpeed, this.maxThetaSpeed);
    this.initColor = initColor;
    this.finColor = finColor;
    this.fillColor = this.initColor;
    this.size = size;
  }
  // Trying to make constructors that fill in some parameters, but the main constructor doesn't take in colors because it thinks they're ints
  GraphicObject(float minXSpeed, float maxXSpeed, float minYSpeed,
                  float maxYSpeed, float minThetaSpeed, float maxThetaSpeed,
                  float size, color initColor
                ) {
    GraphicObject(minXSpeed, maxXSpeed, minYSpeed,
                    maxYSpeed, minThetaSpeed, maxThetaSpeed, size,
                    initColor, initColor
    );
  }
  GraphicObject(float minXSpeed, float maxXSpeed, float minYSpeed,
                  float maxYSpeed, float minThetaSpeed, float maxThetaSpeed,
                  float size
                ) {
                  color temp_color = color(random(0,255), random(0,255), random(0,255));
                  GraphicObject(minXSpeed, maxXSpeed, minYSpeed,
                    maxYSpeed, minThetaSpeed, maxThetaSpeed, size,
                    temp_color, temp_color
                   );
        };
  abstract void display();

  void move() {
    this.extraMove();
    this.ySpeed = min(this.maxYSpeed, max(this.minYSpeed, this.ySpeed));
    this.xSpeed = min(this.maxXSpeed, max(this.minXSpeed, this.xSpeed));
    this.x += this.xSpeed;
    this.y += this.ySpeed;
    this.fillColor 
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