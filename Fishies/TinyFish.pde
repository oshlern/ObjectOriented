class TinyFish extends AquariumObject {
  float yposRangeLow;
  float yposRangeHigh;
  float ypos2;
  float yspeed;
  float toggle = 0;
 
  TinyFish(float tempxpos,
           float tempyposRangeLow, float tempyposRangeHigh,
           float tempxspeed, float tempyspeed) {        
    super(tempxpos,
          random(tempyposRangeLow, tempyposRangeHigh),
          tempxspeed);
    ypos2 = ypos;
    yspeed = tempyspeed;
  }
 
  void display(){
    fill(250, 250, 0);
    noStroke();
    ellipse(xpos, ypos2, 10, 7); 
    triangle(xpos+2, ypos2, xpos+10, ypos2, xpos+12, ypos2+10);
    triangle(xpos+2, ypos2, xpos+10, ypos2, xpos+12, ypos2-10);
    fill (0);
    ellipse(xpos-3, ypos2-2, 2, 2);
    stroke(1);
    strokeWeight(1);
    noFill();
    //x, y, width, height, start, stop (angle in radians)
    arc(xpos-5, ypos2, 4, 4, 0, PI/2);
    noStroke();
  }
  
  void reappear() {
    super.reappear();
    ypos = random(yposRangeLow, yposRangeHigh);
    ypos2 = ypos;
  }
 
  void move(){
    super.move();
    ypos2 = ypos2 - yspeed;
    if (ypos2 < ypos - 20 || ypos2 > ypos + 20){
      yspeed = -yspeed;
    }
  }
 
}