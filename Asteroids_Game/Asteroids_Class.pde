class Asteroids {
 PVector loc, vel;
 float sz;

 Asteroids(float tempsz){
  sz = tempsz; 
  loc = new PVector(random(width), random(height));
  vel = new PVector(random(-4,4), random(-4,4)); 
 }
 
 void display(){
  fill(255);
  ellipse(loc.x, loc.y, sz, sz); 
 }
 
 void move(){
  loc.add(vel); 
 }
 
 void wallBounce(){
   if(loc.x + sz/2 > width){
    vel.x = -abs(vel.x); 
   }
   if(loc.x - sz/2 < 0){
    vel.x = abs(vel.x); 
   }
   if(loc.y + sz/2 > height){
    vel.y = -abs(vel.y); 
   }
   if(loc.y - sz/2 < 0){
    vel.y = abs(vel.y); 
   }
 }
 

}
