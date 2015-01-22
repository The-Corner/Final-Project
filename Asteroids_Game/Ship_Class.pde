class Rocketship {
  //Declare the location, velocity, size, and image for the rocketship
  PVector loc, vel;
  float sz;
  PImage rocketship;
  //Declare the variable for the angle
  float theta;
  
  Rocketship() {
    //Initialize the location, velocity, size, and image for the rocketship
    loc = new PVector(width/2, height/2);
    sz = 100;
    rocketship = loadImage("rocketship.png");
    //Change rectangle mode to rotate around the center
    imageMode(CENTER);
  } 
  
  void display() {
    pushMatrix();                     //create a temporary coordinate system
    translate(loc.x, loc.y);          //moves the image origin to the center of the screen
    rotate(theta);                    //rotation rotates by a specified number of radians
    image(rocketship, 0, 0, sz, sz);  //draw image at 0, 0
    popMatrix();                      //exit temporary coordinate system
  }

  void update() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        theta-=radians(2); //the angle of the image decreases and turns left if left arrow key is pressed
      } else if (keyCode == RIGHT) {
        theta+=radians(2); //the angle increases and turns right if the right arrow key is pressed
      }
    }
  }
}
