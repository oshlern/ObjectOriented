class Position {
  public float x;
  public float y;
  public float theta;

  Position(float x, float y, float theta) {
    this.x = x;
    this.y = y;
    this.theta = theta;
  }
  
  Position(float x, float y) {
    this.x = x;
    this.y = y;
    this.theta = 0.0;
  }
  
  void addVelocity(Position velocity) {
    this.x += velocity.x;
    this.y += velocity.y;
    this.theta += velocity.theta;
  }
}