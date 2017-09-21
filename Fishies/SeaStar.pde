class SeaStar extends AquariumObject {
  PShape star;
 
  SeaStar (float tempxpos, float tempypos) {
    super(tempxpos, tempypos, 0);

    star = createShape();
    star.beginShape();
    // You can set fill and stroke
    star.fill(255, 255, 0);
    // Here, we are hardcoding a series of vertices
    star.vertex(xpos+0, ypos-30);
    star.vertex(xpos+8, ypos-10);
    star.vertex(xpos+27, ypos-5);
    star.vertex(xpos+13, ypos+7);
    star.vertex(xpos+19, ypos+30);
    star.vertex(xpos+0, ypos+15);
    star.vertex(xpos-19, ypos+30);
    star.vertex(xpos-13, ypos+7);
    star.vertex(xpos-27, ypos-5);
    star.vertex(xpos-8, ypos-10);
    star.endShape(CLOSE);
  }

  void display() {
    shape(star);
    fill (0);
    ellipse(xpos-7, ypos-4, 3, 3);
    ellipse(xpos+7, ypos-4, 3, 3);
    stroke(1);
    strokeWeight(1);
    noFill();
    // x, y, width, height, start, stop (angle in radians)
    arc(xpos, ypos+5, 13, 10, 0, PI);
    noStroke();
  } 
}