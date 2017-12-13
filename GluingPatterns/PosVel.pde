// Doubles as velocity class
class PosVel extends LineSegment {

    public float theta;
    public float spin;

    PosVel(float x, float y, float theta, float x_vel, float y_vel, float spin) {
        super(x, y, x_vel, y_vel);
        this.theta = theta;
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

    public void rotateVel(float angle) {
        float cosine = cos(angle);
        float sine = sin(angle);
        float new_x = cosine*this.x - sine*this.y;
        this.y = sine*this.x + cosine*this.y;
        this.x = new_x;
    }

    public void reflectVel(Vector line) {
        
    }

    public void setPos(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public void setPos(Vertex v) {
        setPos(v.x, v.y);
    }
   }

    public void addVel() {
        this.v.x += this.x_vel;
        this.v.y += this.y_;
        this.theta += this.spin;
    }

    public void addVel(float t) {
        this.v.x += this.x*t;
        this.v.y += this.y*t;
        this.theta += this.spin;
    }

}