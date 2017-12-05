class Vector extends Vertex {
    public final float magnitude;

    Vector(float x, float y) {
        super(x,y);
    }

    Vector(Vertex v1, Vertex v2) {
        super(v2.x - v1.x, v2.y - v1.y);
    }

    public float Dot(Vertex v) {
        return this.x*v.x + this.y*v.y;
    }

    public float Cross(Vertex v) {
        return this.x*v.y-this.y*v.x;
    }
    
    public float absCross(Vertex v) {
      return abs(this.Cross(v));
    }

    public float magnitude() {
        this.magnitude = x*x + y*y;
        return this.magnitude;
    }

    public void normalize() {
        float mag = this.magnitude();
        this.x = this.x/mag;
        this.y = this.y/mag;
    }
}