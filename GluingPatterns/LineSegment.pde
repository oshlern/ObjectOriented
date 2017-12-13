class LineSegment extends Vector {

    public final Vertex v;

    LineSegment(Vertex v1, Vertex v2) {
        super(v1, v2);
        this.v = v;
    }

    LineSegment(Vertex v, Vector vel) {
        super(vel.x, vel.y);
        this.v = v;
    }

    LineSegment(float x, float y, float x_vel, float y_vel) {
        super(x_vel, y_vel);
        this.v = Vertex(x, y);
    }

    public Vertex atTime(float t) {
        if (t < 0. || t > 1.) {
            return null;
        }
        return new Vertex(v.x + this.x*t, v.y + this.y*t);
    }
}