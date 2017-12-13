class SoaringBird extends GraphicObject {

    SoaringBird() {
        super(new PosVel(random(0, width), random(height/2, height), 0.0, random(3.0, 5.0), 0.0, 0.0), 30.0);
    }

    public void display() {
        fill(this.FILL_COLOR);
        ellipse(this.pos_vel.v.x, this.pos_vel.v.y, this.SIZE*2, this.SIZE);
    }

}