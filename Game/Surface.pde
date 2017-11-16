abstract class Surface {

    protected ArrayList<GraphicObject> objects;

    Surface() {
        this.reset();
    }

    public void insertObject(GraphicObject object) {
        this.objects.add(object);
    }

    public void insertObjects(ArrayList<GraphicObject> objects) {
        this.objects.addAll(objects);
    }

    public void reset() {
        this.objects = new ArrayList<GraphicObject>();
    }

    protected void moveObjects() {
        for (GraphicObject object : objects) {
            object.pos.addVel(object.vel);
            object.extraMove();
            Position[] wrapped_pos_and_vel = this.wrapAround(object.pos, object.vel);
            object.pos = wrapped_pos_and_vel[0];
            object.vel = wrapped_pos_and_vel[1];
        }
    }

    protected void displayObjects() {
        for (GraphicObject object : objects) {
            object.display();
        }
    }

    abstract protected Position[] wrapAround(Position pos, Position vel);

    public void iterate() {
        moveObjects();
        displayObjects();
    }

}
// add acceleration?