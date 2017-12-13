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
        for (Edge edge : edges) {
            stroke(edge.fillcolor);
            fill(edge.fillcolor);
            strokeWeight(4);
            edge.display();
        }
    }

}
  