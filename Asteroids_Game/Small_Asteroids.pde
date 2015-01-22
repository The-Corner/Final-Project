class SmallAsteroids {
  PVector loc, vel;
  float sz;
  float hue;

  SmallAsteroids() {
    sz = 50;
    loc = new PVector(random(width), random(height));
    vel = new PVector(random(-1.5, 1.1), random(-1.5, 1.6));
    hue = random(360);
  }

  void display() {
    fill(hue, 200, 200);
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
  
   boolean explodes(Fire bullets) {
    if (loc.dist(bullets.loc) < sz/2 + bullets.sz/2) {
      return true;
    } else {
      return false;
    }
  }
}
