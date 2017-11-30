class Sphere extends Surface {

    protected Position[] wrapAround(Position pos, Position vel) {
        Position[] pos_vel = new Position[]{pos, vel};

        if (pos.x > width) {
            pos_vel[0].x = width*(pos_vel[0].y/height);
            pos_vel[0].y = height;
            float new_y_vel = -pos_vel[1].x;
            pos_vel[1].x = pos_vel[1].y;
            pos_vel[1].y = new_y_vel;
        } else if (pos.x < 0) {
            pos_vel[0].x = width*(pos_vel[0].y/height);
            pos_vel[0].y = 0;
            float new_y_vel = -pos_vel[1].x;
            pos_vel[1].x = pos_vel[1].y;
            pos_vel[1].y = new_y_vel;
        }

        if (pos.y > height) {
            pos_vel[0].y = height*(pos_vel[0].x/width);
            pos_vel[0].x = width;
            float new_x_vel = -pos_vel[1].y;
            pos_vel[1].y = pos_vel[1].x;
            pos_vel[1].x = new_x_vel;
        } else if (pos.y < 0) {
            pos_vel[0].y = height*(pos_vel[0].x/width);
            pos_vel[0].x = 0;
            float new_x_vel = -pos_vel[1].y;
            pos_vel[1].y = pos_vel[1].x;
            pos_vel[1].x = new_x_vel;
        }

        return pos_vel;
    }

}