class Polygon{

    public final Vertex[] vertices;
    public final Edge[] edges;
    public final int n;

    Polygon(Vertex[] vertices) {
        this.vertices = vertices;
        this.n = vertices.length;
        this.edges = new Edge[this.n];
        for (int i=0; i<this.n-1; i++) {
            edges[i] = new Edge(vertices[i], vertices[i+1], this);
        }
        edges[this.n-1] = new Edge(vertices[this.n-1], vertices[0], this);
    }
    
    public boolean isInside(Vertex v) {
        return true;
    }

    public void display() {
        stroke(0,0,0);
        for (int i=0; i<this.n-1; i++) {
            line(vertices[i].x, vertices[i].y, vertices[i+1].x, vertices[i+1].y);
        }
        line(vertices[n-1].x, vertices[n-1].y, vertices[0].x, vertices[0].y);
    }

}
  