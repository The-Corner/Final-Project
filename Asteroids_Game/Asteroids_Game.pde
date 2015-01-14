Asteroids [] asteroids = new Asteroids[10];
Rocketship player;
Fire f;
ArrayList<Fire> bullets = new ArrayList<Fire>();

void setup(){
colorMode(HSB);
size(displayWidth, displayHeight);
//initializing the asteroids & their size
 for(int i = 0; i < asteroids.length; i++){
  asteroids[i] = new Asteroids(100);
 }
 //initialize a new rocketship and a new bullet
 player = new Rocketship();
 f = new Fire(player);
}

void draw(){
  background(0);
  
 //drawing the asteroids
for(int i = 0; i < asteroids.length; i++){
 asteroids[i].Adisplay();
 asteroids[i].Amove();
 asteroids[i].AwallBounce(); 
}

//drawing the ship
player.shipDisplay();
//update the rotation of the rocketship every frame
player.shipUpdate();

//drawing the bullets
 if(keyPressed){
  if(keyCode == 49){
   //Everytime the spacebar is pressed a bullet is added
   bullets.add(new Fire(player)); 
  }
 } 

for(int i = 0; i < bullets.size(); i++){
 f = bullets.get(i);
 f.Fdisplay();
}

}
