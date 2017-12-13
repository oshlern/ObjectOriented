class Edge extends LineSegment{

    public Polygon polygon; // final
    public Gluing gluing; // final
    public final Vector tangent;
    public final Vector normal;
    public color fillcolor;

    Edge(Vertex v1, Vertex v2, Polygon polygon) {
        this(v1, v2);
        this.polygon = polygon;
    }

    Edge(Vertex v1, Vertex v2) {
        super(v1, v2);
        this.tangent = new Vector(this.x/this.magnitude(), this.y/this.magnitude());
        this.normal = new Vector(this.y, -this.x);
        this.fillcolor = color(0,0,0);
        this.gluing = new Boundary(this);
    }

    public float normalDistanceTo(Vertex v) {
        return abs(this.normal.Dot(new Vector(this.v, v)));
    }

    public float distanceTo(Vertex v) {
        Vector dist = new Vector(this.v, v);
        float normal_distance = this.normal.Dot(dist);
        float tangent_distance = 0.0f;
        float tangent_component = this.tangent.Dot(dist);
        if (tangent_component > this.magnitude()) {
            tangent_distance = tangent_component - this.magnitude();
        } else if (tangent_component < 0.) {
            tangent_distance = -tangent_component;
        }
        return sqrt(normal_distance*normal_distance + tangent_distance*tangent_distance);
    }

    public float[] intersection(LineSegment v) {
        float crossed = v.Cross(this);
        float[] does_not_intersect = {0.0f, 0.0f};
        if (crossed == 0.0f) {
            return does_not_intersect;
        }
        Vector delta_v = new Vector(this.v, v.v);
        float this_t = -delta_v.Cross(v)/crossed;
        if (this_t <= 0. || this_t > 1.) {
            return does_not_intersect;
        }
        float v_t = -delta_v.Cross(this)/crossed;
        if (v_t <= 0. || v_t > 1.) {
            return does_not_intersect;
        }
        return new float[]{this_t, v_t};
    }

}