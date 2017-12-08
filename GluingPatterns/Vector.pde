class Vector extends Vertex {

    public final float magnitude;

    Vector(Vertex v) {
        super(v.x, v.y);
    }

    Vector(float x, float y) {
        super(x, y);
    }

    Vector(Vertex v1, Vertex v2) {
        super(v2.x - v1.x, v2.y - v1.y);
    }

    public float Dot(Vertex v) {
        return this.x*v.x + this.y*v.y;
    }

    public float Cross(Vertex v) {
        return this.x*v.y - this.y*v.x;
    }
    
    public float absCross(Vertex v) {
      return abs(this.Cross(v));
    }

    // Not initialized in constructor because not always needed.
    public float magnitude() {
        if (this.magnitude == 0.0f) {
          this.magnitude = this.x*this.x + this.y*this.y;
        }
        return this.magnitude;
    }

    public void normalize() {
        float mag = this.magnitude();
        this.x = this.x/mag;
        this.y = this.y/mag;
    }
}