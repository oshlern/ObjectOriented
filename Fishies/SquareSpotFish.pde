class SquareSpotFish extends AquariumObject {
 
  SquareSpotFish(float tempxpos, float tempypos, float tempspeed) {
    super(tempxpos, tempypos, tempspeed);
  }
 
  void display(){
    fill(200, 120, 0);
    noStroke();
    ellipse(xpos, ypos, 40, 20); 
    triangle(xpos+18, ypos, xpos+28, ypos, xpos+35, ypos+20);
    triangle(xpos+18, ypos, xpos+28, ypos, xpos+35, ypos-20);
    fill (0);
    ellipse(xpos-13, ypos-4, 3, 3);
    stroke(1);
    strokeWeight(1);
    noFill();
    // x, y, width, height, start, stop (angle in radians)
    arc(xpos-15, ypos, 10, 10, 0, PI/2);
    noStroke();
    fill(200, 0, 200);
    rect(xpos-2, ypos-5, 10, 10);
  }
}