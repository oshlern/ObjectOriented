class Fish extends AquariumObject {
  color fishColor;
 
  Fish(color tempColor, float tempXpos, float tempYpos, float tempXspeed) {
    super(tempXpos, tempYpos, tempXspeed);
    fishColor = tempColor;
  }
 
  void display() {
    fill(fishColor);
    noStroke();
    // body
    ellipse(xpos, ypos, 40, 20);
    // bottom fin
    triangle(xpos-5, ypos+5, xpos+5, ypos+5, xpos+10, ypos+25);
    // top fin
    triangle(xpos-5, ypos-5, xpos+5, ypos-5, xpos+10, ypos-25);
    // bottom tail
    triangle(xpos+18, ypos, xpos+28, ypos, xpos+35, ypos+35);
    // top tail
    triangle(xpos+18, ypos, xpos+28, ypos, xpos+35, ypos-35);
    fill (0);
    ellipse(xpos-13, ypos-4, 3, 3);
    stroke(1);
    strokeWeight(1);
    noFill();
    // x, y, width, height, start, stop (angle in radians)
    arc(xpos - 15, ypos, 10, 10, 0, PI/2);
    noStroke();
  }

}