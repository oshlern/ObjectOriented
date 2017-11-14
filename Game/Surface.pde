abstract class Surface {
  public GraphicObject[] objects;
  
  void moveObjects() {
    for (GraphicObject object : objects) {
      object.pos.addVel(object.vel);
      object.extraMove();
      object.pos = this.wrapAround(object.pos);
    }
  }
  
  void displayObjects() {
    for (GraphicObject object : objects) {
      object.display();
    }
  }
  
  abstract Position wrapAround(Position pos) {}
}