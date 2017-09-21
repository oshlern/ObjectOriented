class Octopus extends AquariumObject {
  float size; 
  float xpos2;
  float swayspeed;
  float ypos2; 
  int state = 0;
  int state2 = 2;

  Octopus (float tempxpos, float tempypos,
           float tempxspeed, float tempswayspeed, float tempsize) {
    super(tempxpos, tempypos, tempxspeed);
    size = tempsize;
    xpos2 = tempxpos;
    swayspeed = tempswayspeed;
    ypos2 = tempypos;
  }
 
  void display () {
    fill(0, 0, 250);
    noStroke();
    ellipse(xpos2, ypos2, size, size);
    stroke(0, 0, 250);
    //bottom legs
    beginShape();
    strokeWeight(size/4);
    noFill();
    // first point, left left
    vertex(xpos2, ypos2);
    // first control, second control, next point on curve
    bezierVertex(xpos - size, ypos2 + size,
                 xpos + size/4, ypos2 + size/2 + size,
                 xpos - size, ypos2 + size + size);
    endShape();
    beginShape();
    strokeWeight(size/4);
    noFill();
    // first point, right left
    vertex(xpos2 + size/2 - size/16, ypos2);
    // first control, second control, next point on curve
    bezierVertex(xpos + size, ypos2 + size,
                 xpos - size/4, ypos2 + size/2 + size,
                 xpos + size, ypos2 + size + size);
    endShape();
    beginShape();
    strokeWeight(size/4);
    noFill();
    // first point, left right
    vertex(xpos2 + size/2 - size/4, ypos2);
    // first control, second control, next point on curve
    bezierVertex(xpos - size/3, ypos2 + size/2 + size/4,
                 xpos + size/10, ypos2 + size/2.5,
                 xpos - size/4, ypos2 + size + size);
    endShape();
    beginShape();
    strokeWeight(size/4);
    noFill();
    // first point, right right
    vertex(xpos2 + size/2 - size/20, ypos2);
    // first control, second control, next point on curve
    bezierVertex(xpos + size/3, ypos2 + size/2 - size/4,
                 xpos - size/10, ypos2 + size/4 + size/2,
                 xpos + size/4, ypos2 + size + size);
    endShape();
    //side legs
    beginShape();
    strokeWeight(size/4);
    noFill();
    // first point, left top
    vertex(xpos2, ypos2);
    // first control, second control, next point on curve
    bezierVertex(xpos2 - size, ypos,
                 xpos2 - size - size/2, ypos + size,
                 xpos2 - size*2, ypos + size);
    endShape();
    beginShape();
    strokeWeight(size/4);
    noFill();
    // first point, right top
    vertex(xpos2, ypos2);
    // first control, second control, next point on curve
    bezierVertex(xpos2 + size, ypos,
                 xpos2 + size + size/2, ypos + size,
                 xpos2 + size*2, ypos + size);
    endShape();
    beginShape();
    strokeWeight(size/4);
    noFill();
    // first point, left bottom
    vertex(xpos2, ypos2);
    // first control, second control, next point on curve
    bezierVertex(xpos2 - size, ypos + size,
                 xpos2 - size - size/2, ypos + 2*size,
                 xpos2 - size*2, ypos + size/2 + size);
    endShape();
    beginShape();
    strokeWeight(size/4);
    noFill();
    // first point, right bottom
    vertex(xpos2, ypos2);
    // first control, second control, next point on curve
    bezierVertex(xpos2 + size, ypos + size,
                 xpos2 + size + size/2, ypos + 2*size,
                 xpos2 + size*2, ypos + size/2 + size);
    endShape();
    noStroke();
   
    fill (0);
    ellipse(xpos2-7, ypos2-4, 3, 3);
    ellipse(xpos2+7, ypos2-4, 3, 3);
    stroke(1);
    strokeWeight(1);
    noFill();
    arc(xpos2, ypos2+5, 13, 10, 0, PI); //x, y, width, height, start, stop (angle in radians)
    noStroke();
  }
 
  void swayLeft(){
    xpos = xpos - 2*swayspeed;
  }
 
  void swayRight() {
      xpos = xpos + 2*swayspeed;
  }
 
  void swayUp() {
    ypos = ypos - swayspeed;
  }
 
  void swayDown() {
    ypos = ypos+ swayspeed;
  }

  void move() {
    float edge1 = xpos2 + size/2;
    float edge2 = xpos2 - size/2;
    float edge3 = ypos2 + size/2;
    float edge4 = ypos2;
    xpos2 = xpos2 - xspeed;
   
    if (xpos2 < 1) {
      xpos2 = width;
      xpos = xpos2;
    }
    
    if (state == 0) {
      swayRight();
      if (xpos > edge1) {
        state = 1;
      }
    }
    if (state == 1) {
      swayLeft();
      if (xpos < edge2) {
        state = 0;
      }
    }
    if (state2 == 2) {
        swayUp();
        if (ypos < edge4) {
          state2 = 3;
        }
    }
    if (state2 == 3){
       swayDown();
       if (ypos > edge3) {
        state2 = 2;
       }
    }
  }
 
}