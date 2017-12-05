class Edge extends LineSegment{

    //private final Vector tangent;
    private final Vector normal;
    private final float normal_component;
    private final float smaller_tangent_component;
    private final float bigger_tangent_component;

    Edge(Vertex v1, Vertex v2) {
        super(v1, v2);
        this.normal = new Vector(this.y, -this.x);
        this.normal_component = this.normal.Dot(v1);
        float v1_tangent_component = this.Dot(v1);
        float v2_tangent_component = this.Dot(v2);
        if (v1_tangent_component > v2_tangent_component) {
            this.bigger_tangent_component = v1_tangent_component;
            this.smaller_tangent_component = v2_tangent_component;
        } else {
            this.bigger_tangent_component = v2_tangent_component;
            this.smaller_tangent_component = v1_tangent_component;
        }
    }

    public float normalDistanceTo(Vertex v) {
        return abs(this.normal.Dot(v) - this.normal_component);
    }

    public float distanceTo(Vertex v) {
        float tangent_distance = 0;
        tangent_component = this.Dot(v);
        if (tangent_component > bigger_tangent_component) {
            tangent_distance = tangent_component - bigger_tangent_component;
        } else if (tangent_component < smaller_tangent_component) {
            tangent_distance = smaller_tangent_component - tangent_component;
        }
        return sqrt((this.normal.Dot(v) - this.normal_component)^2 + tangent_distance^2);
    }

    public float intersection(LineSegment v) {
        float crossed = v.Cross(this);
        if (crossed == 0.) {
            return null;
        }
        Vector delta_v = new Vector(this.v1, v.v1);
        float this_t = delta_v.Cross(v)/crossed;
        if (this_t < 0. || this_t > 1) {
            return null;
        }
        float v_t = -delta_v.Cross(this)/crossed;
        if (v_t < 0. || v_t > 1) {
            return null;
        }
        return t;
}