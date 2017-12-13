class Surface {

    private final Polygon[] polygons;
    protected ArrayList<GraphicObject> objects;

    Surface(Polygon[] polygons, ArrayList<EdgeIdentification> ids) {
        for (EdgeIdentification id : ids) {
            id.edge1.gluing = new Gluing(id);
            id.edge2.gluing = new Gluing(id.edge1.gluing);
        }
    }

    public void iterate() {
        for (GraphicObject object : this.objects) {
            this.moveAndCheckEdges(object);
            object.display();
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