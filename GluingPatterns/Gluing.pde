class Gluing {

    public final Edge this_edge;
    public final Edge glued_edge;
    public final float theta;
    public final boolean reflect;
    public color fillcolor;

    Gluing(EdgeIdentification id) {// this_edge, glued_edge) {
        this.this_edge = id.edge1;
        this.glued_edge = id.edge2;
        this.theta = this.angleBetween(id.edge1, id.edge2);
        this.reflect = id.reflect;
        this.fillcolor = id.fillcolor;
    }

    Gluing(Gluing opposite_gluing) {
        this.this_edge = opposite_gluing.glued_edge;
        this.glued_edge = opposite_gluing.this_edge;
        this.theta = -opposite_gluing.theta;
        this.reflect = opposite_gluing.reflect;
        this.fillcolor = opposite_gluing.fillcolor;
    }

    Gluing(Edge this_edge, Edge glued_edge, float theta, boolean reflect) {
        this.this_edge = this_edge;
        this.glued_edge = glued_edge;
        this.theta = theta;
        this.reflect = reflect;
        this.fillcolor = color(0,0,0);
    }

    public void move(PosVel pos_vel, float time_along_edge, float time_along_vel) {
        float old_mag = pos_vel.magnitude();
        pos_vel.reflectVel(this.this_edge);
        if (this.reflect) {
            pos_vel.reflectVel(this.this_edge.normal);
            pos_vel.setPos(this.glued_edge.atTime(1. - time_along_edge));
        } else {
            pos_vel.spin = -pos_vel.spin;
            pos_vel.setPos(this.glued_edge.atTime(time_along_edge));
        }
        pos_vel.rotateVel(this.theta);
        pos_vel.theta += this.theta;
        //pos_vel.addVel(1. - time_along_vel);
        float new_mag = pos_vel.magnitude();
        println(old_mag, new_mag, "Mags");
    }

    private float angleBetween(Edge edge1, Edge edge2) {
        return edge2.angle() - edge1.angle();
    }

}