SoaringBird[] sbs;
FlittingBird[] fbs;
FallingFeather[] ffs;

int num_sbs;
int num_fbs;
int num_ffs;

void setup() {
  noStroke();
  size(600, 400);

  num_sbs = 5;
  num_fbs = 5;
  num_ffs = 10;

  sbs = new SoaringBird[num_sbs];
  fbs = new FlittingBird[num_fbs];
  ffs = new FallingFeather[num_ffs];
  
  //graphic_groups = 

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
  
  for (int i=0; i<num_sbs; i++) {
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