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
    //Initialize the variable for the angle
  }  
  void Rdisplay() {
    //Set rocketship location to the mouse location
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    image(rocketship, 0, 0, sz, sz);
    popMatrix();
  }

  void Rupdate() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        theta-=radians(5);
      } else if (keyCode == RIGHT) {
        theta+=radians(5);
      }
    }
  }
}
