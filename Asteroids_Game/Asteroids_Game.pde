//github version
//declare the integers for screen size
int screenSZx, screenSZy;
//initialize stages for game to go through ie: startscreen, level 1, level 2, ...
int stage = 1;
//declare PImage for the start screen background and instructions background
PImage startBG;
PImage instructions;
PImage gameOverBG;
//declare a new Rocketship, Fire, Asteroids, and SmallAsteroids ArrayList
ArrayList<Rocketship> player = new ArrayList<Rocketship>();
ArrayList<Fire> bullets = new ArrayList<Fire>();
ArrayList<Asteroids> asteroids = new ArrayList<Asteroids>(); 
ArrayList<SmallAsteroids> smAsteroids = new ArrayList<SmallAsteroids>();
//declaring value for scoreboard
int score = 0;

void setup() {
  size(800, 600);
  colorMode(HSB);

  //initializing screen size
  screenSZx = round(displayWidth*.90);
  screenSZy = round(displayHeight*.90);
  size(screenSZx, screenSZy);
  //loading image for background of start screen, instructions screen, and game over screen
  startBG = loadImage("StartBG.jpg");
  instructions = loadImage("AsteroidsInstructions.jpg");
  gameOverBG = loadImage("gameOver.jpg");

  //Initialize a new rocketship
  for (int r = 0; r < 1; r++) {  //1 rocketship appears
    player.add(new Rocketship());
  }

  //initializing the asteroids & the number that originally appear
  for (int i = 0; i < 8; i++) {     //8 big asteroids originally appear
    asteroids.add(new Asteroids());
  }

  //initializing the small asteroids and the number that originally appear
  for (int p = 0; p < 5; p++) {     //5 small asteroids originally appear
    smAsteroids.add(new SmallAsteroids());
  }
}

void draw() {
  frameRate(150);
  //start screen
  //start screen is stage 1
  if (stage == 1) {
    //display start screen image for the background
    image(startBG, width/2, height/2, screenSZx, screenSZy); 
    if (keyPressed) {
      if (key == ENTER || key == RETURN) { //if enter/return key is pressed, stage 2 begins
        stage = 2;
        print("go");
      }
      if (key == ' ') {  //if space bar pressed, then stage 3 begins and the game starts
        stage = 3;
        println("start the game");
      }
    }
  }
  if (stage == 2) {     //if spacebar is pressed on stage 2, then stage 3 begins and the game starts
    if (keyPressed) {
      if (key == ' ') {
        stage = 3;
      }
    }
  }
  //if statement to make stage with instructions appear
  //stage 2 is the instructions page
  if (stage == 2) {
    image(instructions, width/2, height/2, screenSZx, screenSZy);  //display the image that has the instructions & make it the background
  }
  //if statement to make stage with game: start game
  //stage 3 begins the game
  if (stage == 3) {
    println("game starts now");
    background(0);
    //display the bullets
    for (int i = 0; i < bullets.size (); i++) {
      Fire f = bullets.get(i);
      f.display(); //display the bullets
      f.update();  //remove the bullets if they go off-screen
    }
    //draw bullets when spacebar is pressed
    if (keyPressed) {
      if (key == ' ') {
        for (int r = 0; r < player.size (); r++) {
          Rocketship c = player.get(r);
          bullets.add(new Fire(c));
        }
      }
    }

    //drawing the rocketship
    for (int r = 0; r < player.size (); r++) {
      Rocketship g = player.get(r);
      g.display();  //display the spaceship
      g.update();   //Update the rotation of the rocketship every frame
      //player loses if hit by large asteroid
      for (int i = 0; i < asteroids.size (); i++) {
        Asteroids a = asteroids.get(i);
        if (a.hitsShip(g)) {
          stage = 4; //if a big asteroid hits the ship, stage 4 begins (game over screen)
        }
      }
      //game over if hit by small asteroid
      for (int h = 0; h < smAsteroids.size (); h++) {
        SmallAsteroids s = smAsteroids.get(h);
        if (s.hitsShip(g)) {
          stage = 4;  //if the ship is hit by a small asteroid, stage 4 begins (game over screen)
        }
      }
    }
    //drawing the big asteroids
    for (int i = 0; i < asteroids.size (); i++) {
      Asteroids a = asteroids.get(i);
      a.display();     //display the big asteroids
      a.move();        //move asteroids 
      a.wallHit();     //asteroids appear on the opposite side if they go off-screen

      //removing the big asteroids
      for (int j = 0; j < bullets.size (); j++) {
        Fire b = bullets.get(j);
        if (a.explodes(b)) {   //if bullet touches an asteroid
          asteroids.remove(a); //asteroid is removed
          score += 20;         //score increases by 20 when a big asteroid is hit
        }
      }
    }
    //continuously add big asteroids
    if (frameCount % 150 == 0) {       //if 150 frames have passed
      asteroids.add(new Asteroids());  //a new big asteroid is added
    }

    //drawing the small asteroids
    for (int p = 0; p < smAsteroids.size (); p++) {
      SmallAsteroids s = smAsteroids.get(p); 
      s.display();  //display the small asteroids
      s.move();     //move small asteroids
      s.wallHit();  //small asteroids appear on the opposite side if they go off-screen

      //removing the small asteroids
      for (int k = 0; k < bullets.size (); k++) {
        Fire b2 = bullets.get(k); 
        if (s.explodes(b2)) {
          smAsteroids.remove(s); //if a bullet touches an asteroid, that asteroid is removed
          score += 50; //the player scores 50 points everytime a small asteroid is hit
        }
      }     
    }
    //continuously add small asteroids
    if(frameCount % 150 == 0){              //if 150 frames have passed
     smAsteroids.add(new SmallAsteroids()); //a new small asteroid is drawn
    }

    //score board
    textSize(30); 
    textAlign(CENTER); 
    fill(255); 
    text(score, 100, 70);
  }

  //if the ship is hit by an asteroid, the game ends and stage 4 begins
  //stage 4 is the game over screen
  if (stage == 4) {
    background(0); 
    image(gameOverBG, width/2, height/2, screenSZx, screenSZy); //display the background image for the game over screen
    text("YOUR SCORE:" + " " + score, width/2, height/2 + 6); //add text that displays the player's score 
    if (keyPressed) {
      if (key == 'p') {  //if the 'p' key is pressed, then stage one starts and the player is brought back to the start menu
        stage = 1; 
        score = 0; //score resets when game starts over
        //large asteroids
        asteroids = new ArrayList<Asteroids>(); 
        for (int i = 0; i < 8; i++) {
          asteroids.add(new Asteroids());
        }
        //small asteroids
        smAsteroids = new ArrayList<SmallAsteroids>(); 
        for (int p = 0; p < 5; p++) {
          smAsteroids.add(new SmallAsteroids());
        }
      }
    }
  }
}

