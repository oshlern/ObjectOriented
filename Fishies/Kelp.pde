class Kelp extends AquariumObject {
  color kelpColor;
  float bottom;
  float tall;
  float strokeThickness;
  float fixedxpos;
  float swayWidth;
  int state = 0;
 
  // traits of kelp: color, x position, height, thickness,
  // sway speed, sway width
  Kelp (color tempColor, float tempfixedxpos, float tempXpos,
        float tempbottom, float temptall, float tempstrokeThickness,
        float tempswaySpeed, float tempswayWidth ) {
    super(tempXpos, tempbottom - temptall, tempswaySpeed);
    kelpColor = tempColor;
    tall = temptall;
    strokeThickness = tempstrokeThickness;
    fixedxpos = tempfixedxpos;
    swayWidth = tempswayWidth;
    bottom = tempbottom;
  }
 
  void display () {
    noFill();
    stroke(kelpColor);
    beginShape();
    strokeWeight(strokeThickness);
    // first point
    vertex(fixedxpos, bottom);
    
    //first control, second control, next point on curve
    bezierVertex(xpos-swayWidth, ypos+tall/3,
                 xpos+swayWidth, ypos+tall/2,
                 xpos, ypos);
    endShape();
    noStroke();
  }

  void move() {
    super.move();
    if (xpos > fixedxpos + swayWidth || xpos < fixedxpos - swayWidth) {
      xspeed = -xspeed;
    }
  }

}