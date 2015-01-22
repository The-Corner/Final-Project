
//declare the integers for screen size
int screenSZx, screenSZy;
//initialize stages for game to go through ie: startscreen, level 1, level 2, ...
int stage = 1;
//declare PImage for the start screen background and instructions background
PImage startBG;
PImage instructions;
//declare a new rocketship
Rocketship player;
ArrayList<Fire> bullets = new ArrayList<Fire>();
ArrayList<Asteroids> asteroids = new ArrayList<Asteroids>(); 
ArrayList<SmallAsteroids> smAsteroids = new ArrayList<SmallAsteroids>();
//initialize value for scoreboard
int score = 0;

void setup() {
  size(800, 600);
  colorMode(HSB);

  //initializing screen size
  screenSZx = round(displayWidth*.90);
  screenSZy = round(displayHeight*.90);
  size(screenSZx, screenSZy);
  //loading image for background of start screen and instructions screen
  startBG = loadImage("StartBG.jpg");
  instructions = loadImage("AsteroidsInstructions.jpg");
  image(startBG, 0, 0, screenSZx, screenSZy);

  //Initialize a new rocketship
  player = new Rocketship();

  //initializing the asteroids & the number that appear
  for (int i = 0; i < 8; i++) {
    asteroids.add(new Asteroids());
  }

  //initializing the small asteroids and the number that appear
  for (int p = 0; p < 5; p++) {
    smAsteroids.add(new SmallAsteroids());
  }
}

void draw() {
  frameRate(150);
  //start screen
  if (stage == 1) {
    if (keyPressed) {
      if (key == ENTER || key == RETURN) { //if enter/return key is pressed, stage 2 begins
        stage = 2;
        print("go");
      }
      if (key == ' ') {  //if space bar pressed, then stage 3 begins
        stage = 3;
      }
    }
  }
  if (stage == 2) {
    if (keyPressed) {
      if (key == ' ') {
        stage = 3;
      }
    }
  }
  //if statement to make stage with instructions appear
  //stage 2 is the instructions page
  if (stage == 2) {
    image(instructions, width/2, height/2, screenSZx, screenSZy);
  }
  //if statement to make stage with game: start game
  //stage 3 is level one of game
  if (stage == 3) {
    background(0);
    //display the bullets
    for (int i = 0; i < bullets.size (); i++) {
      Fire f = bullets.get(i);
      f.display();
      f.update();
    }
    //draw bullets when spacebar is pressed
    if (keyPressed) {
      if (key == ' ') {
        bullets.add(new Fire(player));
      }
    }

    //display the spaceship
    player.display();
    //Update the rotation of the rocketship every frame
    player.update();
    //removing the ship if hit by asteroid
    for (int i = 0; i < asteroids.size (); i++) {
      Asteroids a = asteroids.get(i);
      if (a.hitsShip(player)) {
        //player.remove();
      }
    }
    
    //drawing the asteroids
    for (int i = 0; i < asteroids.size (); i++) {
      Asteroids a = asteroids.get(i);
      a.display();     //display the asteroids
      a.move();        //move asteroids 
      a.wallHit();     //asteroids appear on the opposite side if they go off-screen

      //removing the asteroids
      for (int j = 0; j < bullets.size (); j++) {
        Fire b = bullets.get(j);
        if (a.explodes(b)) {   //if bullet touches an asteroid
          asteroids.remove(a); //asteroid is removed
          score += 20;         //score increases by 20 when an asteroid is hit
        }
      }
    }
    //drawing the small asteroids
    for (int p = 0; p < smAsteroids.size (); p++) {
      SmallAsteroids s = smAsteroids.get(p);
      s.display();
      s.move();
      s.wallHit();    

      //removing the small asteroids
      for (int k = 0; k < bullets.size (); k++) {
        Fire b2 = bullets.get(k);
        if (s.explodes(b2)) {
          smAsteroids.remove(s);
          score += 50;
        }
      }
    }

    //score board
    textSize(30);
    textAlign(CENTER);
    fill(255);
    text(score, 100, 70);
  }
}
