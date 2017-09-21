class Submarine extends AquariumObject {
  boolean isVisible = false;
 
  Submarine(float tempxpos, float tempypos, float tempspeed) {
    super(tempxpos, tempypos, tempspeed);
  }
 
  void display(){
    if (isVisible) {
      fill(250, 250, 0);
      noStroke();
      ellipse(xpos, ypos, 150, 50); 
      rect(xpos, ypos-80, 10, 80);
      rect(xpos-15, ypos-80, 15, 10);
      fill (0, 0, 200);
      stroke(1);
      strokeWeight(1);
      ellipse (xpos-40, ypos, 10, 10);
      ellipse (xpos-20, ypos, 10, 10);
      ellipse (xpos, ypos, 10, 10);
      ellipse (xpos+20, ypos, 10, 10);
      ellipse (xpos+40, ypos, 10, 10);
      noFill();
      noStroke();
    }
  }
  
  void reappear() {
    super.reappear();
    isVisible = false;
  }
 
  void move() {
    if (isVisible) {
      super.move();
    }
  }
  
  void appear() {
    isVisible = true;
  }
 
}