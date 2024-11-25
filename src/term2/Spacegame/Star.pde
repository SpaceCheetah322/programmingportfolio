class Star {
  float x, y, speed;

  Star() {
    x = random(width);
    y = -10;
    speed = random(2, 5); // Random initial speed for each star
  }

  void display() {
    stroke(255);
    point(x, y);
  }

  void move() {
    y += speed; // Normal speed (no time slow effect)
  }

  boolean reachedBottom() {
    return y > height + 10; // Return true if the star has moved past the bottom
  }
}
