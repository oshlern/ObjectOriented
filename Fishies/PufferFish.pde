class PufferFish extends AquariumObject {
  boolean puffed = false;
 
  PufferFish(float tempXpos, float tempYpos, float tempXspeed) {
    super(tempXpos, tempYpos, tempXspeed);
  }
 
  void smallDisplay(){
    fill(250);
    noStroke();
    // body
    ellipse(xpos, ypos, 40, 40);
    // right fin
    triangle(xpos+18, ypos, xpos+28, ypos, xpos+30, ypos+10);
    // right fin
    triangle(xpos+18, ypos, xpos+28, ypos, xpos+30, ypos-10);
    // left fin
    triangle(xpos-18, ypos, xpos-28, ypos, xpos-30, ypos+10);
    // left fin
    triangle(xpos-18, ypos, xpos-28, ypos, xpos-30, ypos-10);
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
 
   void puffedDisplay(){
    fill(250);
    noStroke();
    // body
    ellipse(xpos, ypos, 80, 80);
    // right fin
    triangle(xpos+38, ypos, xpos+48, ypos, xpos+50, ypos+10);
    // right fin
    triangle(xpos+38, ypos, xpos+48, ypos, xpos+50, ypos-10);
    // left fin
    triangle(xpos-38, ypos, xpos-48, ypos, xpos-50, ypos+10);
    // left fin
    triangle(xpos-38, ypos, xpos-48, ypos, xpos-50, ypos-10);
    fill (0);
    ellipse(xpos-7, ypos-4, 3, 3);
    ellipse(xpos+7, ypos-4, 3, 3);
    stroke(1);
    strokeWeight(1);
    noFill();
    //x, y, width, height, start, stop (angle in radians)
    arc(xpos, ypos + 5, 13, 10, 0, PI);
    noStroke();
  }
  
  void display() {
    if (puffed) {
      puffedDisplay();
    }
    else {
      smallDisplay();
    }
  }

}