class Gluing {

    Edge this_edge;
    Edge glued_edge;
    float theta;
    boolean reflect;

    Gluing(EdgeIdentification id) {// this_edge, glued_edge) {
        this.this_edge = id.edge1;
        this.glued_edge = id.edge2;
        this.theta = this.angleBetween(id.edge1, id.edge2);
        this.reflect = id.reflect;
    }

    Gluing(Gluing opposite_gluing) {
        this.this_edge = opposite_gluing.glued_edge;
        this.glued_edge = opposite_gluing.this_edge;
        this.theta = -opposite_gluing.theta;
        this.reflect = opposite_gluing.reflect;
    }

    public void move(PosVel pos_vel, float time_along_edge, float time_along_vel) {
        pos_vel.reflectVel(this.this_edge);
        if (this.reflect) {
            pos_vel.reflectVel(this.this_edge.normal);
            pos_vel.setPos(this.glued_edge.atTime(1. - time_along_edge));
        } else {
            pos_vel.setPos(this.glued_edge.atTime(time_along_edge));
        }
        pos_vel.rotateVel(this.theta);
        pos_vel.addVel(1. - time_along_vel);
    }

}