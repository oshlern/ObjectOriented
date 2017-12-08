// Doubles as velocity class
class PosVel extends LineSegment {

    public float theta;
    public float spin;

    PosVel(float x, float y, float theta, float x_vel, float y_vel, float spin) {
        super(new Vertex(x, y)this.x = x;
        this.y = y;
        this.theta = theta;
        this.x_vel = x_vel;
        this.y_vel = y_vel;
        this.spin = spin;
    }
    
    Position(Vertex pos, Vector vel) {
        super(pos, vel);
        this.theta = 0.0f;
        this.spin = 0.0f;
    }

    Position(Vertex pos, Vector vel) {
        super(pos, vel);
        this.theta = 0.0f;
        this.spin = 0.0f;
    }
    
    public void addVel() {
        this.v.x += this.x;
        this.v.y += this.y;
        this.theta += this.spin;
    }

    public void addVel(float t) {
        this.v.x += this.x*t;
        this.v.y += this.y*t;
        this.theta += this.spin;
    }

}