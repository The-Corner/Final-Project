class Rocketship {
  //Declare the location, velocity, size, and image for the rocketship
  PVector shipLoc, shipVel;
  float shipSZ;
  PImage rocketship;
  //Declare the variable for the angle
  float theta;
  
  Rocketship() {
    //Initialize the location, velocity, size, and image for the rocketship
    shipLoc = new PVector(width/2, height/2);
    shipSZ = 100;
    rocketship = loadImage("rocketship.png");
    //Change rectangle mode to rotate around the center
    imageMode(CENTER);
  }  
  
  void shipDisplay() {
    //Set rocketship location to the mouse location
    pushMatrix();
    translate(shipLoc.x, shipLoc.y);
    rotate(theta);
    image(rocketship, 0, 0, shipSZ, shipSZ);
    popMatrix();
  }

  void shipUpdate() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        theta-=radians(5);
      } else if (keyCode == RIGHT) {
        theta+=radians(5);
      }
    }
  }
}
