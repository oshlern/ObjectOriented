class Bubble extends AquariumObject {
  float absxpos;
  float absypos;
  float yspeed;
  float size;
 
  Bubble(float tempxpos, float tempypos,
         float tempxspeed, float tempyspeed,
         float tempsize) {
    super(tempxpos, tempypos, tempxspeed);
    absxpos = tempxpos;
    absypos = tempypos;
    yspeed = tempyspeed;
    size = tempsize;
  }
 
  void display() {
    noFill();
    stroke(0);
    strokeWeight(1);
    ellipse(xpos, ypos, size, size); 
    noStroke();
  }
 
  void move() {
    ypos = ypos - yspeed;
    if(ypos < 1) {
      ypos = absypos;
    }
    
    xpos = xpos - xspeed;
    if (xpos < absxpos - 20 || xpos > absxpos + 20) {
      xspeed = -xspeed;
    }
  }
 
}