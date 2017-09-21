class Jellyfish extends AquariumObject {
  float size; 
  float xpos2;
  float swayspeed;

  Jellyfish (float tempxpos, float tempypos, float tempxspeed,
             float tempswayspeed, float tempsize) {
    super(tempxpos, tempypos, tempxspeed);
    size = tempsize;
    xpos2 = tempxpos;
    swayspeed = tempswayspeed;
  }
 
  void display () {
    fill(250, 0, 250);
    noStroke();
    ellipse(xpos, ypos, size, size - size/2);
    stroke(250, 0, 250);
    beginShape();
    strokeWeight(size/20);
    noFill();
    // first point
    vertex(xpos, ypos);
    // first control, second control, next point on curve
    bezierVertex(xpos2 - size, ypos + size/3,
                 xpos2 + size, ypos + size/2+size,
                 xpos, ypos + size + size);
    endShape();
    beginShape();
    strokeWeight(size/20);
    noFill();
    // first point
    vertex(xpos + size/2 - size/16, ypos);
    // first control, second control, next point on curve
    bezierVertex(xpos2 - size, ypos + size/1.5,
                 xpos2 + size, ypos + size/2,
                 xpos + size/2, ypos + size + size);
    endShape();
    beginShape();
    strokeWeight(size/20);
    noFill();
    // first point
    vertex(xpos + size/2 - size/4, ypos);
    // first control, second control, next point on curve
    bezierVertex(xpos2 - size, ypos + size/4,
                 xpos2 + size, ypos + size/2.5,
                 xpos + size/2 - size/4, ypos + size + size/4);
    endShape();
    beginShape();
    strokeWeight(size/20);
    noFill();
    // first point
    vertex(xpos + size/2 - size/20, ypos);
    // first control, second control, next point on curve
    bezierVertex(xpos2 + size, ypos + size/2 - size/4,
                 xpos2 - size, ypos + size/4 + size/2,
                 xpos, ypos + size + size/2);
    endShape();
    noStroke();
  }

  void move() {
    super.move();
    ypos = ypos - abs(swayspeed);
    if (ypos < 1) {
      ypos = height;
    }
    if (xpos2 > xpos + size/2 || xpos2 < xpos - size/2) {
      swayspeed = -swayspeed;
      while (xpos2 > xpos + size/2 || xpos2 < xpos - size/2) {
        xpos2 = xpos2 + 2*swayspeed;
      }
    }
    xpos2 = xpos2 + 2*swayspeed;
  }
  
  void reappear() {
    super.reappear();
    xpos2 = xpos;
  }
 
}