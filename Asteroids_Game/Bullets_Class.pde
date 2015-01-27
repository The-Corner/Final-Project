class Fire {
  //declare the location, velocity, & size of the bullets
  PVector loc, vel;
  float sz = 10;
  
  Fire(Rocketship player)  {
    //initialize the location and velocity
    loc = player.loc.get();
    vel = PVector.fromAngle(player.theta);
  }
  
  void display() {
    noStroke();
    fill(255);
    //display the bullets
    ellipse(loc.x, loc.y, sz, sz);
    //move the bullets
    loc.add(vel);
  }
   void update(){
  //removing the bullets if they go off-screen
  if(loc.x + sz/2 > width || loc.x - sz/2 < 0 || loc.y + sz/2 > height || loc.y - sz/2 < 0){
   bullets.remove(0);
  } 
 }

}
