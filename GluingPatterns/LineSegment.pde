class LineSegment extends Vector {

    public Vertex v;

    LineSegment(Vertex v1, Vertex v2) {
        super(v1, v2);
        this.v = v1;
    }

    LineSegment(Vertex v, Vector vel) {
        super(vel.x, vel.y);
        this.v = v;
    }

    LineSegment(float x, float y, float x_vel, float y_vel) {
        super(x_vel, y_vel);
        this.v = new Vertex(x, y);
    }

    public Vertex atTime(float t) {
        if (t < 0. || t > 1.) {
            return null;
        }
        return new Vertex(this.v.x + this.x*t, this.v.y + this.y*t);
    }

    public void display() {
        ellipse(this.v.x, this.v.y, 3, 3);
        line(this.v.x, this.v.y, this.v.x+this.x, this.v.y+this.y);
    }

}