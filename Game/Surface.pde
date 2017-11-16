abstract class Surface {
  public ArrayList<GraphicObject> objects;

  Surface() {
    this.reset();
  }

  void insertObject(GraphicObject object) {
    this.objects.add(object);
  }

  void insertObjects(ArrayList<GraphicObject> objects) {
    this.objects.addAll(objects);
  }

  void reset() {
    this.objects = new ArrayList<GraphicObject>();
  }

  void moveObjects() {
    for (GraphicObject object : objects) {
      object.pos.addVel(object.vel);
      object.extraMove();
      Position[] wrapped_pos_and_vel = this.wrapAround(object.pos, object.vel);
      object.pos = wrapped_pos_and_vel[0];
      object.vel = wrapped_pos_and_vel[1];
    }
  }

  void displayObjects() {
    for (GraphicObject object : objects) {
      object.display();
    }
  }

  abstract Position[] wrapAround(Position pos, Position vel);

  void iterate() {
    moveObjects();
    displayObjects();
  }
}
// add acceleration?