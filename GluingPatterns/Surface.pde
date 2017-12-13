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
            id.edge1.fillcolor = id.edge1.gluing.fillcolor;
            id.edge2.fillcolor = id.edge2.gluing.fillcolor;
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
            //object.pos_vel.display();
        }
        for (Polygon polygon : this.polygons) {
            polygon.display();
        }
    }

    // Given a graphic object and its polygon, iterate over edges to see if it collides with any edges, then move it.
    private void moveAndCheckEdges(GraphicObject object) {
        boolean intersected = false;
        for (Edge edge : object.polygon.edges) {
            //if (object.pos_vel.magnitude() >= edge.distanceTo(object.pos_vel)) {
                float[] ts = edge.intersection(object.pos_vel);
                if (ts[0] != 0.0f) {//{0.0f, 0.0f}) {
                    //println("within range");
                    //println(ts[0], ts[1], object.pos_vel);
                    edge.gluing.move(object.pos_vel, ts[0], ts[1]);
                    object.polygon = edge.gluing.glued_edge.polygon;
                    intersected = true;
                }
            //}
        } 
        if (!intersected) {
            object.pos_vel.addVel();
        }
    }

}