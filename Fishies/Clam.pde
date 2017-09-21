class Clam extends AquariumObject {
  float size;
 
  Clam (float tempxpos, float tempypos, float tempsize) {
    super(tempxpos, tempypos, 0);
    size = tempsize;
  }
 
  void display() {
    fill(200, 200, 200);
    ellipse(xpos, ypos, size, size/2);
    pushMatrix();
    translate(xpos, ypos + size/4);
    rotate(radians(15));
    ellipse(0, 0, size, size/2);
    popMatrix();
    pushMatrix();
    translate(xpos, ypos + size/4);
    rotate(radians(30));
    ellipse(0, 0, size, size/2);
    popMatrix();
    pushMatrix();
    translate(xpos, ypos + size/4);
    rotate(radians(60));
    ellipse(0, 0, size, size/2);
    popMatrix();
    pushMatrix();
    translate(xpos - size/4, ypos + size/4);
    rotate(radians(90));
    ellipse(0, 0, size, size/2);
    popMatrix();
    pushMatrix();
    translate(xpos - size/2, ypos + size/4);
    rotate(radians(110));
    ellipse(0, 0, size, size/2);
    popMatrix();
    pushMatrix();
    translate(xpos - size/2, ypos + size/4);
    rotate(radians(140));
    ellipse(0, 0, size, size/2);
    popMatrix();
    triangle(xpos, ypos, xpos - size, ypos, xpos, ypos - size/2 - size/4);
  }
}