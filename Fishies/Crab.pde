class Crab extends AquariumObject {
  float size;
  int state = 0;
 
  Crab (float tempxpos, float tempypos, float tempsize, float tempspeed) {
    super(tempxpos, tempypos, tempspeed);
    size = tempsize;
  }
 
  void display() {
    fill(200, 0, 0);
    stroke(200, 0, 0);
    strokeWeight(2);
    line(xpos - size/3, ypos, xpos - size/3, ypos + size/2);
    line(xpos + size/3, ypos, xpos + size/3, ypos + size/2);
    noStroke();
    ellipse(xpos, ypos, size, size/2);
    pushMatrix();
    translate(xpos - size/4, ypos + size/2);
    rotate(radians(45));
    ellipse(0, 0, size/2, size/4);
    fill(150,120,100);
    triangle(0, 0, 0, size/10, size/2, 0);
    popMatrix();
    pushMatrix();
    translate(xpos + size/4, ypos + size/2);
    rotate(radians(135));
    fill(200, 0,0);
    ellipse(0, 0, size/2, size/4);
    fill(150,120,100);
    triangle(0, 0, 0, size/10, size/2, 0);
    popMatrix();
    fill(0, 0,0);
    ellipse(xpos+5, ypos, 3, 3);
    ellipse(xpos-5, ypos, 3, 3);
  }
  
  void move() {
    xpos += xspeed;
    if (xpos > width || xpos < 0) {
      xspeed = -xspeed;
    }
  }

}