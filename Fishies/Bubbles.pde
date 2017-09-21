class Bubbles extends AquariumObject {
  float numBubbles;
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
 
  Bubbles(float numBubbles, float tempxpos, float tempypos,
          float xspeedLow, float xspeedHigh,
          float yspeedLow, float yspeedHigh,
          float sizeLow, float sizeHigh) {
    // speed for the Bubbles is zero; individual Bubbles have speed
    super(tempxpos, tempypos, 0);
    for (int index = 0; index < numBubbles; ++index) {
      bubbles.add(new Bubble(xpos, ypos,
                             random(xspeedLow, xspeedHigh),
                             random(yspeedLow, yspeedHigh),
                             random(sizeLow, sizeHigh)));
    }
  }
 
  void display() {
    for (Bubble bubble : bubbles) {
      bubble.move();
      bubble.display();
    } 
  }
}