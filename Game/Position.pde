// Doubles as velocity class
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
  
  void addVel(Position vel) {
    this.x += vel.x;
    this.y += vel.y;
    this.theta += vel.theta;
  }
}