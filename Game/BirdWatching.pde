GraphicObject[] objects;
int num_objects;

void setup() {
  noStroke();
  size(600, 400);
  num_objects = 30;
  objects = new Circle[num_objects];

  for (int i=0; i<num_sbs; i++) {
    sbs[i] = new SoaringBird();
  }
  for (int i=0; i<num_fbs; i++) {
    fbs[i] = new FlittingBird();
  }
  for (int i=0; i<num_ffs; i++) {
    ffs[i] = new FallingFeather();
  }
  
}

void draw() {
  background(173,216,230);
  
  for (int i=0; i<objects.len; i++) {
    sbs[i].move();
    sbs[i].display();
  }
  for (int i=0; i<num_fbs; i++) {
    fbs[i].move();
    fbs[i].display();
  }
  for (int i=0; i<num_ffs; i++) {
    ffs[i].move();
    ffs[i].display();
  }
}