class EdgeIdentification {

    public final Edge edge1;
    public final Edge edge2;
    public final boolean reflect;

    EdgeIdentification(Edge edge1, Edge edge2, boolean twist) {
        this.edge1 = edge1;
        this.edge2 = edge2;
        this.reflect = !twist;
    }

}