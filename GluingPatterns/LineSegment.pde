class LineSegment extends Vector {

    public final Vertex v1;
    public final Vertex v2;
    
    LineSegment(Vertex v1, Vertex v2) {
        super(v1, v2);
        this.v1 = v1;
        this.v2 = v2;
    }
}