class Laser {
  // Member variables
  int x, y, w, h, speed;
  PImage l1; // Laser image

  // Constructor
  Laser(int x, int y, PImage img) { // Accept an image as a parameter
    this.x = x;
    this.y = y;
    w = 5;
    h = 20;
    speed = 9; // Do not go too high, or else the collision detection will fail
    l1 = img; // Use the passed-in image
  }

  // Member Methods
  void display() {
    if (l1 != null) {
      imageMode(CENTER);
      image(l1, x, y);
    }
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    return y < -20;
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    return d < 45;
  }
}
