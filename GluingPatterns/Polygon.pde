class Polygon{

    Vertex[] vertices;
    Edge[] edges;
    int n;

    Polygon(Vertex[] vertices) {
        this.vertices = vertices;
        this.n = vertices.length;
        this.edges = new Edge[n];
        for (int i=0; i<n-1; i++) {
            edges[i] = new Edge(vertices[i], vertices[i+1]);
        }
        edges[n] = new Edge(vertices[n], vertices[0]);
    }
}
  