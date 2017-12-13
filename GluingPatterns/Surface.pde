class Surface {

    private final Polygon[] polygons;
    ArrayList<EdgeIdentification> identifications;
    protected ArrayList<GraphicObject> objects;

    Surface(Polygon[] polygons, ArrayList<EdgeIdentification> ids) {
        this.polygons = polygons;
        this.identifications = ids;
        for (EdgeIdentification id : ids) {
            id.edge1.gluing = new Gluing(id);
            id.edge2.gluing = new Gluing(id.edge1.gluing);
        }
        this.resetObjects();
    }

    public void insertObject(GraphicObject object) {
        this.objects.add(object);
    }

    public void insertObjects(ArrayList<GraphicObject> objects) {
        this.objects.addAll(objects);
    }

    public void resetObjects() {
        this.objects = new ArrayList<GraphicObject>();
    }

    public void iterate() {
        for (GraphicObject object : this.objects) {
            this.moveAndCheckEdges(object);
            object.display();
        }
        for (Polygon polygon : this.polygons) {
            polygon.display();
        }
    }

    // Given a graphic object and its polygon, iterate over edges to see if it collides with any edges, then move it.
    private void moveAndCheckEdges(GraphicObject object) {
        int n = object.polygon.edges.length;
        if (n != 0) {
        for (Edge edge : object.polygon.edges) {
            if (object.pos_vel.magnitude() >= edge.distanceTo(object.pos_vel)) {
                float[] ts = edge.intersection(object.pos_vel);
                if (ts[0] != 0.0f) {//{0.0f, 0.0f}) {
                    edge.gluing.move(object.pos_vel, ts[0], ts[1]);
                    object.polygon = edge.gluing.glued_edge.polygon;
                }
            } else {
                object.pos_vel.addVel();
            }
        }
        }
    }

}