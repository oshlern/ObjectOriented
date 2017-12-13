class Surface {

    private final Polygon[] polygons;
    private final EdgeIdentification[] edge_identifications;
    protected ArrayList<GraphicObject> objects;

    public void iterate() {
        for (GraphicObject object : this.objects) {
            this.moveAndCheckEdges(object);
        }
    }

    // Given a graphic object and its polygon, iterate over edges to see if it collides with any edges, then move it.
    private void moveAndCheckEdges(GraphicObject object) {
        for (Edge edge : object.polygon.edges) {
            if (object.pos_vel.magnitude() >= edge.distanceTo(object.pos_vel)) {
                float[] ts = edge.intersection(object.pos_vel);
                if (ts != {0.0f, 0.0f}) {
                    edge.gluing.move(object.pos_vel, ts[0], ts[1]);
                    object.polygon = edge.gluing.glued_edge.polygon;
                }
            } else {
                object.addVel();
            }
        }
    }

}