class Asteroids {
 PVector loc, vel;
 float astrdSZ;
 float hue;

 Asteroids(float tempsz){
  astrdSZ = tempsz; 
  loc = new PVector(random(width), random(height));
  vel = new PVector(random(-4,4), random(-4,4));
  hue = random(360); 
 }
 
 void display(){
  fill(hue, 200, 200);
  ellipse(loc.x, loc.y, astrdSZ, astrdSZ); 
 }
 
 void move(){
  loc.add(vel); 
 }
 
 void wallHit(){
   if(loc.x + astrdSZ/2 > width){
    vel.x = -abs(vel.x); 
   }
   if(loc.x - astrdSZ/2 < 0){
    vel.x = abs(vel.x); 
   }
   if(loc.y + astrdSZ/2 > height){
    vel.y = -abs(vel.y); 
   }
   if(loc.y - astrdSZ/2 < 0){
    vel.y = abs(vel.y); 
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
