class Anenome extends AquariumObject {
  float size;
  Kelp[] kelp = new Kelp[7];
  boolean noCrabNearby = true;
 
  Anenome(float tempxpos, float tempypos, float tempsize) {
    // doesn't move; speed is zero
    super(tempxpos, tempypos, 0);
    size = tempsize;
    // traits of kelp: color, x position, xpos,
    // ypos, height, thickness, sway speed, sway width
    kelp[0] = new Kelp(color(200, 200, 0),
                       xpos, xpos,
                       ypos, size/2, size/20, 0.5, 3);
    kelp[1] = new Kelp(color(200, 200, 0),
                       xpos + size/2, xpos + size/2,
                       ypos, size/2, size/20, 0.05, 4);
    kelp[2] = new Kelp(color(200, 200, 0),
                       xpos + size/3, xpos + size/3,
                       ypos, size/2, size/20, 0.2, 6);
    kelp[3] = new Kelp(color(200, 200, 0),
                       xpos + size/2 - size/3, xpos + size/2 - size/2,
                       ypos, size/2, size/20, 0.4, 2);
    kelp[4] = new Kelp(color(200, 200, 0),
                       xpos - size/4, xpos - size/4,
                       ypos, size/2, size/20, 0.3, 7);
    kelp[5] = new Kelp(color(200, 200, 0),
                       xpos - size/2, xpos - size/2,
                       ypos, size/2, size/20, 0.6, 5);
    kelp[6] = new Kelp(color(200, 200, 0),
                       xpos - size/2 + size/3, xpos - size/2 + size/3,
                       ypos, size/2, size/20, 0.1, 8);
  }
 
  void display(){
    fill(250,150,0);
    ellipse (xpos, ypos, size, size/2);
    if (noCrabNearby) {
      for (Kelp k : kelp) {
        k.move();
        k.display();
      }
    }
  }
  
  void checkCrab(Crab crab) {
    if (crab.xpos - crab.size/2 > xpos + size/2 ||
        crab.xpos + crab.size/2 < xpos - size/2) {
      noCrabNearby = true;
    } else {
      noCrabNearby = false;
    }
  }
}