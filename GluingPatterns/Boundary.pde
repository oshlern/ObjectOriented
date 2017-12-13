class Boundary extends Gluing {

    Boundary(Edge edge) {
        super(edge, edge, 0.0f, false);
    }

    public void move(PosVel pos_vel, float time_along_edge, float time_along_vel) {
        pos_vel.reflectVel(this.this_edge);
        pos_vel.setPos(this.this_edge.atTime(time_along_edge));
        pos_vel.spin = -pos_vel.spin;
        //pos_vel.addVel(1. - time_along_vel);
    }

}