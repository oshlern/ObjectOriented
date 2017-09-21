class AquariumObject {
  float xpos;
  float ypos;
  float xspeed;
  
  AquariumObject(float tempxpos, float tempypos, float tempxspeed) {
    xpos = tempxpos;
    ypos = tempypos;
    xspeed = tempxspeed;
  }
  
  void display() {
  }
  
  void move() {
    xpos = xpos - xspeed;
    if(xpos < 1){
      reappear();
    }    
  }
  
  void reappear() {
    xpos = width;
  }
}