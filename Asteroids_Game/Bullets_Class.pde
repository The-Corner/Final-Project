class Fire {
  PVector loc, vel;
  float sz = 10;
  int bullet = 1;
  
  Fire(Rocketship player) {
    loc = player.loc.get();
    vel = PVector.fromAngle(player.theta);
  }
  void Fdisplay() {
    ellipse(loc.x, loc.y, sz, sz);
    loc.add(vel);
  }
}

