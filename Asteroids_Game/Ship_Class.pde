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
  
  void display() {
    //create a temporary coordinate system
    pushMatrix();
    //translates the image around the center of the screen
    translate(shipLoc.x, shipLoc.y);
    //object rotates by specified number of radians
    rotate(theta);
    image(rocketship, 0, 0, shipSZ, shipSZ);
    //exit the temporary coordinate system
    popMatrix();
  }

  void update() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        theta-=radians(3);
      } else if (keyCode == RIGHT) {
        theta+=radians(3);
      }
    }
  }
}
