int stage = 1;
PImage startBG;
PImage instructions;
ArrayList <Asteroids> asteroids = new ArrayList<Asteroids>();
Rocketship player;
ArrayList<Fire> bullets = new ArrayList<Fire>();

void setup() {
  colorMode(HSB);
  size(displayWidth, displayHeight);
  
  //initializing screen size
  screenSZx = round(displayWidth*.90);
  screenSZy = round(displayHeight*.90);
  size(screenSZx, screenSZy);
  //loading image for background of start screen and instructions screen
  startBG = loadImage("StartBG.jpg");
  instructions = loadImage("AsteroidsInstructions.jpg");
  image(startBG, 0, 0, screenSZx, screenSZy);

  //initializing the asteroids & their size
  for (int i = 0; i < asteroids.length; i++) {
    asteroids[i] = new Asteroids(100);
  }
  //initialize a new rocketship and a new bullet
  player = new Rocketship();

  //initializing the asteroids & their size
  for (int i = 0; i < 5; i++) {
    asteroids.add(new Asteroids());
  }
}

void draw() {
  frameRate(150);
  background(0);
  //start screen
  if (stage == 1) {
    if (keyPressed) {
      if (key == ENTER || key == RETURN) { //if enter/return key is pressed, stage 2 begins
        stage = 2;
        print("go");
      }
    }
    if (key == ' ') {  //if space bar pressed, then stage 3 begins
      stage = 3;
    }
  }
  //if statement to make stage with instructions appear
  //stage 2 is the instructions page
  if (stage == 2) {
    image(instructions, 0, 0, screenSZx, screenSZy);
  }
  //if statement to make stage with game: start game
  //stage 3 is level one of game
  if (stage == 3) {
   background(0); 
  //drawing the asteroids
  for (int i = 0; i < asteroids.size(); i++) {
    Asteroids a = asteroids.get(i);
    a.display();
    a.move();
    a.wallHit();
    
    if(asteroids.explodes(bullets)){{
     a.remove(i); 
    }
  }

  //drawing the ship
  player.display();
  //update the rotation of the rocketship every frame
  player.update();

  //drawing the bullets
  if (keyPressed) {
    if (keyCode == ' ') {
      //Everytime the spacebar is pressed a bullet is added
      bullets.add(new Fire(player));
    }
  } 

  for (int i = 0; i < bullets.size (); i++) {
    f = bullets.get(i);
    f.Fdisplay();
  }
}

