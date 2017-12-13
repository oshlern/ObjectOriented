class Polygon{

    public final Vertex[] vertices;
    public final Edge[] edges;
    public final int n;
    public float min_x; // final
    public float max_x; // final
    public float min_y; // final
    public float max_y; // final

    Polygon(Vertex[] vertices) {
        this.vertices = vertices;
        this.n = vertices.length;
        this.edges = new Edge[this.n];
        this.min_x = vertices[this.n-1].x;
        this.max_x = vertices[this.n-1].x;
        this.min_y = vertices[this.n-1].y;
        this.max_y = vertices[this.n-1].y;
        for (int i=0; i<this.n-1; i++) {
            if (vertices[i].x > this.max_x) {
                this.max_x = vertices[i].x;
            } else if (vertices[i].x < this.min_x) {
                this.min_x = vertices[i].x;
            }
            if (vertices[i].y > this.max_y) {
                this.max_y = vertices[i].y;
            } else if (vertices[i].x < this.min_y) {
                this.min_y = vertices[i].y;
            }
            edges[i] = new Edge(vertices[i], vertices[i+1], this);
        }
        edges[this.n-1] = new Edge(vertices[this.n-1], vertices[0], this);
    }
    
    public boolean isInside(Vertex v) {
        int num_crossings = 0;
        for (Edge edge : edges) {
            if (edge.y == 0.0f) {
                continue;
            }
            float time_along = (v.y - edge.v.y)/edge.y;
            if (time_along >= 1.0f || time_along <= 0.0f) {
                continue;
            }
            if (edge.v.x + edge.x*time_along > v.x) {
                num_crossings += 1;
            }
        }
        return (num_crossings%2 == 1);
    }

    public Vertex generatePointInside() {
        Vertex v = new Vertex(random(this.min_x, this.max_x), random(this.min_y, this.max_y));
        if (this.isInside(v)) {
            return v;
        } else {
            return this.generatePointInside();
        }
    }

    public void display() {
        strokeWeight(4);
        for (Edge edge : edges) {
            stroke(edge.fillcolor);
            fill(edge.fillcolor);
            edge.display();
        }
        strokeWeight(1);
    }

}
  