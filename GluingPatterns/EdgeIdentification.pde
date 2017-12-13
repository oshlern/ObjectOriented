class EdgeIdentification {

    public final Edge edge1;
    public final Edge edge2;
    public final boolean reflect;
    public color fillcolor;

    EdgeIdentification(Edge edge1, Edge edge2, boolean twist) {
        this.edge1 = edge1;
        this.edge2 = edge2;
        this.reflect = !twist;
        this.fillcolor = color(random(0, 255), random(0, 255), random(0, 255));
    }

}