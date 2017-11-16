class Torus extends Surface {

    Position[] wrapAround(Position pos, Position vel) {
        Position[] pos_vel = new Position[]{pos, vel} ;

        if (pos.x > width) {
            pos_vel[0].x = 0;
            //pos.x = pos.x % width;
        } else if (pos.x < 0) {
             pos_vel[0].x = width;
        }

        if (pos.y > height) {
             pos_vel[0].y = 0;
            //pos.x = pos.x % width;
        } else if (pos.y < 0) {
             pos_vel[0].y = height;
        }

        return pos_vel;
    }

}