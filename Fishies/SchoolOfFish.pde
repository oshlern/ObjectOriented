class SchoolOfFish extends AquariumObject {
  TinyFish[] tinyfish = new TinyFish[6];
 
  SchoolOfFish(float yposRangeLow, float yposRangeHigh,
               float speedRangeLow, float speedRangeHigh,
               float yspeedLow, float yspeedHigh) {
    // the overall x, y, and speed don't matter; it's only the tiny fish
    super(0, 0, 0);
    for (int index = 0; index < tinyfish.length; ++index) {
      tinyfish[index] = new TinyFish(width,
                                     yposRangeLow, yposRangeHigh,
                                     random(speedRangeLow, speedRangeHigh),
                                     random(yspeedLow, yspeedHigh));
    }
  }
 
  void display(){
    for (TinyFish tf : tinyfish) {
      tf.move();
      tf.display();
    }
  }
}