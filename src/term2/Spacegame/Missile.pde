class Missile {
  // Member variables
  int x, y, w, h, speed;
  PImage l1;

  // Constructor
  Missile(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 20;
    speed = 9; // Do not go too high, or else the collision detection will fail
    l1 = loadImage("Missile.gif");
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
    if (y<-50) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<45) {
      return true;
    } else {
      return false;
    }
  }
}
