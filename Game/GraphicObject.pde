abstract class GraphicObject {
  public Position pos;
  public Position vel;
  public final Position min_vel;
  public final Position max_vel;
  public final float size;
  public final color fillColor;
  
  GraphicObject(Position min_vel, Position max_vel, float size, color initColor, color finColor
                ) {
    this.min_vel = min_vel;
    this.max_vel = max_vel;
    this.pos = Position(random(0, width), random(0, height), random(0, 2*PI));
    this.vel = Position(random(this.min_vel.x, this.max_vel.x), random(this.min_vel.y, this.max_vel.y), random(this.min_vel.theta, this.max_vel.theta)); 
    this.fillColor = this.initColor;
    this.size = size;
  }
  // Trying to make constructors that fill in some parameters, but the main constructor doesn't take in colors because it thinks they're ints
  //GraphicObject(float minXSpeed, float maxXSpeed, float minYSpeed,
  //                float maxYSpeed, float minThetaSpeed, float maxThetaSpeed,
  //                float size, color initColor
  //              ) {
  //  GraphicObject(minXSpeed, maxXSpeed, minYSpeed,
  //                  maxYSpeed, minThetaSpeed, maxThetaSpeed, size,
  //                  initColor, initColor
  //  );
  //}
  //GraphicObject(float minXSpeed, float maxXSpeed, float minYSpeed,
  //                float maxYSpeed, float minThetaSpeed, float maxThetaSpeed,
  //                float size
  //              ) {
  //                color temp_color = color(random(0,255), random(0,255), random(0,255));
  //                GraphicObject(minXSpeed, maxXSpeed, minYSpeed,
  //                  maxYSpeed, minThetaSpeed, maxThetaSpeed, size,
  //                  temp_color, temp_color
  //                 );
  //};

  abstract void display();

  // extraMove is a hook function with no arguments that is called at the beginning of move.
  // It is optionally overwritten in child classes of GraphicObject
  void extraMove() {}
}