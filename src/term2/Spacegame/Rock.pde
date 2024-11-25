class Rock {
  int x, y, diam, speed, originalSpeed;
  PImage r1;

  Rock() {
    x = int(random(width));
    y = -100;
    diam = int(random(20, 100));
    originalSpeed = speed = int(random(1, 6)); // Store and set the initial speed
    r1 = loadImage("Rock01.png");
  }

  void display() {
    imageMode(CENTER);
    r1.resize(diam, diam);
    image(r1, x, y);
  }

  void move() {
    y += speed; // Normal speed (no time slow effect)
  }

  boolean reachedBottom() {
    return y > height + 60; // Return true if the rock has moved off the screen
  }
}
