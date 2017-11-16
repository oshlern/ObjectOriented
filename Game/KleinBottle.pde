class KleinBottle extends Surface {

    Position[] wrapAround(Position pos, Position vel) {
        Position[] pos_vel = new Position[]{pos, vel} ;

    if (pos.x > width) {
        pos_vel[0].x = 0;
        pos_vel[0].y = height - pos_vel[0].y;
    } else if (pos.x < 0) {
        pos_vel[0].x = width;
        pos_vel[0].y = height - pos_vel[0].y;
    }
    if (pos.y > height) {
        pos_vel[0].y = 0;
    } else if (pos.y < 0) {
         pos_vel[0].y = height;
    }

    return pos_vel;
  }

}