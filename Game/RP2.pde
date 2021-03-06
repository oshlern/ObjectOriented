class RP2 extends Surface {

    protected Position[] wrapAround(Position pos, Position vel) {
        Position[] pos_vel = new Position[]{pos, vel};

        if (pos.x > width) {
            pos_vel[0].x = 0;
            pos_vel[0].y = height - pos.y;
            pos_vel[0].theta = -pos.theta;
            pos_vel[1].y = -vel.y;
            pos_vel[1].theta = -vel.theta;
        } else if (pos.x < 0) {
            pos_vel[0].x = width;
            pos_vel[0].y = height - pos.y;
            pos_vel[0].theta = -pos.theta;
            pos_vel[1].y = -vel.y;
            pos_vel[1].theta = -vel.theta;
        }

        if (pos.y > height) {
            pos_vel[0].y = 0;
            pos_vel[0].x = width - pos.x;
            pos_vel[0].theta = PI - pos.theta;
            pos_vel[1].x = -vel.x;
            pos_vel[1].theta = -vel.theta;
        } else if (pos.y < 0) {
            pos_vel[0].y = height;
            pos_vel[0].x = width - pos.x;
            pos_vel[0].theta = PI - pos.theta;
            pos_vel[1].x = -vel.x;
            pos_vel[1].theta = -vel.theta;
        }

        return pos_vel;
    }

}