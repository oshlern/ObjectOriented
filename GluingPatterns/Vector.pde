class Vector {
    public final float magnitude;

    Vector(float x, float y) {
        this.x = x;
        this.y = y;
    }

    Vector(Vertex v1, Vertex v2) {
        this.x = v2.x - v1.x;
        this.y = v2.y - v1.y;
    }

    public float Dot(Vector v) {
        return this.x*v.x + this.y*v.y;
    }

    public float Cross(Vector v) {
        return this.x*v.y - this.y*v.x;
    }
    
    public float absCross(Vector v) {
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