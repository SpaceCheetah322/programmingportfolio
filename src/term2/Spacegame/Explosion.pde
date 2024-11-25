class Explosion {
  int x, y, lifespan;
  int maxSize, currentSize;
  color col;

  Explosion(int x, int y) {
    this.x = x;
    this.y = y;
    lifespan = 15; // Number of frames the explosion lasts
    maxSize = 100;
    currentSize = 0;
    col = color(255, 150, 0); // Orange explosion color
  }

  void display() {
    noStroke();
    fill(col, map(lifespan, 0, 30, 255, 0)); // Fade out over time
    ellipse(x, y, currentSize, currentSize);
    currentSize += 8; // Expand the explosion
  }

  boolean isFinished() {
    lifespan--;
    return lifespan <= 0;
  }
}
