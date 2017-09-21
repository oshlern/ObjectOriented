class Rock extends AquariumObject {

  Rock (float tempxpos, float tempypos){
    super(tempxpos, tempypos, 0);   
  }

  void display() {
    fill(80, 80, 80);
    beginShape();
    vertex(xpos,ypos);
    vertex(xpos+100, ypos);
    vertex(xpos+80, ypos-60);
    vertex(xpos+30, ypos-80);
    vertex(xpos+20, ypos-30);
    endShape();
    noFill();
  }
}