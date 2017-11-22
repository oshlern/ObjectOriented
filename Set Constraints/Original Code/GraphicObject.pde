abstract class GraphicObject {
  public Position pos;
  public Position vel;
  public final float size;
  public final color fillColor;
  //add maxvel

  GraphicObject(Position pos, Position vel, float size, color fillColor) {
    this.pos = pos;
    this.vel = vel;
    this.fillColor = fillColor;
    this.size = size;
  }

  GraphicObject(Position pos, Position vel, float size) {
    this.pos = pos;
    this.vel = vel;
    this.fillColor = color(random(0, 255), random(0, 255), random(0, 255));
    this.size = size;
  }

  GraphicObject(Position pos) {
     this.pos = pos;
     this.vel = new Position(random(-3., 3.), random(-3., 3.), random(-PI/3, PI/3));
     this.fillColor = color(random(0, 255), random(0, 255), random(0, 255));
     this.size = random(5., 25.);
  }

  GraphicObject(float x, float y) {
     this.pos = new Position(x, y, random(0, 2*PI));
     this.vel = new Position(random(-3., 3.), random(-3., 3.), random(-PI/10, PI/10));
     this.fillColor = color(random(0, 255), random(0, 255), random(0, 255));
     this.size = random(5., 25.);
  }

  GraphicObject() {
     this.pos = new Position(random(0., width), random(0., height), random(0, 2*PI));
     this.vel = new Position(random(-3., 3.), random(-3., 3.), random(-PI/10, PI/10));
     this.fillColor = color(random(0, 255), random(0, 255), random(0, 255));
     this.size = random(5., 25.);
  }

  abstract void display();

  // extraMove is a hook function with no arguments that is called at the beginning of move.
  // It is optionally overwritten in child classes of GraphicObject
  void extraMove() {}
}