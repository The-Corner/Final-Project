class SmallAsteroids {
  //declare the location, velocity, size of the small asteroids
  PVector loc, vel;
  float sz;
  //declare variable for hue
  float hue;

  SmallAsteroids() {
    //initialize the size, location, velocity, and hue
    sz = 50;
    loc = new PVector(random(width-100), random(height));
    vel = new PVector(random(-1.5, 1.1), random(-1.5, 1.6));
    hue = random(360);
  }

  void display() {
    //fill the asteroids with random color
    fill(hue, 200, 200);
    //draw a circle to represent the small asteroids
    ellipse(loc.x, loc.y, sz, sz);
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    loc.add(vel);
  }

  void wallHit() { //if asteroid goes off-screen it appears on the opposite side
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

  boolean explodes(Fire bullets) { //determine if a bullet is touching a small asteroid
    if (loc.dist(bullets.loc) < sz/2 + bullets.sz/2) {
      return true;
    } else {
      return false;
    }
  }

  boolean hitsShip(Rocketship player) { //determine if a small asteroid is touching the ship
    if (loc.dist(player.loc) < sz/2 + player.sz/2) {
      return true;
    } else {
      return false;
    }
  }
}
