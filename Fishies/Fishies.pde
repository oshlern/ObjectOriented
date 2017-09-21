ArrayList<AquariumObject> aquariumObjs = new ArrayList<AquariumObject>();
PufferFish pufferfish1;
Crab crab1;
ArrayList<Anenome> anenomes = new ArrayList<Anenome>();
Submarine submarine1;
Clam clam1;

void setup(){
  size(800,500, P2D);

  // traits of fish: color, x, y, speed
  aquariumObjs.add(new Fish(color(200, 0, 0), 250,70, 0.75));
  aquariumObjs.add(new Fish(color(0, 250, 0), 250, 150, 1));
  aquariumObjs.add(new Fish(color(200, 0, 200), 275, 220, 2));
  aquariumObjs.add(new Fish(color(150, 0, 250), width, 400, 0.75));
  aquariumObjs.add(new Fish(color(250, 250, 0), 600, 350, 1));
  aquariumObjs.add(new Fish(color(0, 0, 200), width, 235, 3));

  //traits of kelp: color, fixed x position, xpos, height, thickness,
  // sway speed, sway width
  aquariumObjs.add(new Kelp(color(0,100,0), 100, 100, height,
                   300, 2, .25, 40));
  aquariumObjs.add(new Kelp(color(0, 100, 100), 200, 200, height,
                   250, 6, 0.75, 30));
  aquariumObjs.add(new Kelp(color(0, 200, 0), 80, 80, height,
                   350, 4, 0.5, 50));
  aquariumObjs.add(new Kelp(color(0, 175, 0), 500, 500, height,
                   400, 2, 0.5, 20));
  aquariumObjs.add(new Kelp(color(0, 90, 0), 600, 600, height,
                   175, 7, 0.2, 35));
  aquariumObjs.add(new Kelp(color(0, 220, 0), 720, 720, height,
                   350, 3, 0.3, 45));
  aquariumObjs.add(new Kelp(color(0, 255, 0), 50, 50, height,
                   450, 5, 0.3, 20));
  aquariumObjs.add(new Kelp(color(0, 90, 0), 70, 70, height,
                   220, 7, 0.45, 60));
  aquariumObjs.add(new Kelp(color(0, 168, 0),140, 140, height,
                   160, 6, 0.6, 45));

  // traits of SquareSpotFish: x, y, speed
  aquariumObjs.add(new SquareSpotFish(width, 60, 0.85));
  aquariumObjs.add(new SquareSpotFish(width, 300, .5));
  aquariumObjs.add(new SquareSpotFish(width, 200, 2.1));
  
  // traits of Jellyfish: x start, y start, x speed, sway speed, size
  aquariumObjs.add(new Jellyfish(300, 300, 0.25, 1.5, 50));
  aquariumObjs.add(new Jellyfish(100, 450, 0.75, 0.8, 35));
  aquariumObjs.add(new Jellyfish(400, 200, 0.5, 0.4, 70));
  
  pufferfish1 = new PufferFish(570, 275, 0.25);
  aquariumObjs.add(pufferfish1);
  
  crab1 = new Crab(45, 455, 30, 1);
  aquariumObjs.add(crab1);
  
  anenomes.add(new Anenome(250, 480, 50));
  anenomes.add(new Anenome(400, 470, 30));
  for (Anenome anenome : anenomes) {
    aquariumObjs.add(anenome);
  }
  
  submarine1 = new Submarine(width, 265, 2);
  aquariumObjs.add(submarine1);
  
  aquariumObjs.add(new SchoolOfFish(100, 200, 1, 1.2, 0.4, 0.8));
  aquariumObjs.add(new SchoolOfFish(100, 200, 1.8, 2, 0.8, 1));
  
  clam1 = new Clam(530, 470, 20);
  aquariumObjs.add(clam1);
  
  aquariumObjs.add(new Bubbles(6, 200, height,
                               0.5, 2, 2, 5, 3, 10));
  aquariumObjs.add(new Bubbles(10, clam1.xpos, clam1.ypos,
                               0.2, 1.2, 1, 3, 5, 15));
                               
  aquariumObjs.add(new Rock(600, height));
  
  aquariumObjs.add(new SeaStar(650, 470));
  
  aquariumObjs.add(new Octopus(width, 200, 1, 1, 40));
}

boolean subTrue = false;
void draw(){
  background(0, 200, 200);
  fill(150,120,100);
  rect(0, height-50, width, 50);
  noFill();

  for (AquariumObject aquariumObj : aquariumObjs) {
    aquariumObj.move();
    aquariumObj.display();
  }

  if (mousePressed == true) {
    pufferfish1.puffed = true;
  } else {
    pufferfish1.puffed = false;
  }
  
  for (Anenome anenome : anenomes) {
    anenome.checkCrab(crab1);
  }
  
  if ((keyPressed == true) && (key == 's')) {
    submarine1.appear();
  }

}