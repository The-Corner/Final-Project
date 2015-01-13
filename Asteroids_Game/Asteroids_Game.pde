Asteroids [] asteroids = new Asteroids[10];

void setup(){
size(displayWidth, displayHeight);
//initializing the asteroids & their size
 for(int i = 0; i < asteroids.length; i++){
  asteroids[i] = new Asteroids(100);
 }
 
}

void draw(){
  background(0);
  
 //drawing the asteroids
for(int i = 0; i < asteroids.length; i++){
 asteroids[i].display();
 asteroids[i].move();
 asteroids[i].wallBounce(); 
} 
  
}
