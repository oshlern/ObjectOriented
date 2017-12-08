class Surface {

    private final Polygon[] polygons;
    private final EdgeIdentification[] edge_identifications;
    protected ArrayList<GraphicObject> objects;

    public void iterate() {
        for (GraphicObject object : this.objects) {
            Position[] wrapped_pos_and_vel = this.moveAndCheckEdges(object);
            object.pos = 
        }
    }

    // Given a graphic object and its polygon, iterate over edges to see if it collides with any edges
    // Returns an array of Position and Velocity
    private Position[] moveAndCheckEdges(GraphicObject object) {

    }

}