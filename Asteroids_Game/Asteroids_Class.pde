class Asteroids {
  //declare the location, velocity, and size of the asteroids
  PVector loc, vel;
  float sz;
  //declare variable for the hue
  float hue;

  Asteroids() {
    //initialize the size, location, velocity, and hue of the asteroids
    sz = 100;  
    loc = new PVector(random(width/4), random(height));
    vel = new PVector(random(-.5, 1.1), random(-.5, 1.1));
    hue = random(360);
  }

  void display() {
    //fill of the asteroids with random colors
    fill(hue, 200, 100);
    //draw a circle to represent the asteroids
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    loc.add(vel);
  }

  void wallHit() { //if asteroid goes off screen, it will appear again on the opposite side
    if (loc.x - sz/2 > width) {   //asteroid moves past the right wall 
      loc.x = 0;
    }
    if (loc.x + sz/2 < 0) {       //asteroid moves past left wall
      loc.x = width;
    }
    if (loc.y - sz/2 > height) {  //asteroid move past bottom wall
      loc.y = 0;
    }
    if (loc.y + sz/2 < 0) {       //asteroid moves past top wall
      loc.y = height;
    }
  }

  boolean explodes(Fire bullets) { //determine if a bullet is touching an asteroid
    if (loc.dist(bullets.loc) < sz/2 + bullets.sz/2) { 
      return true;
    } else {
      return false;
    }
  }

  boolean hitsShip(Rocketship player) { //determine if an asteroid is touching the ship
    if (loc.dist(player.loc) < sz/2 + player.sz/2) {
      return true;
    } else {
      return false;
    }
  }
}
