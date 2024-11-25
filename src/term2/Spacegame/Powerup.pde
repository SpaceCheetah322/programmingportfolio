class Powerup {
  // Member variables
  int x, y, diam, speed;
  PImage healthImg, ammoImg, turretImg, missileAmmo, laserPow; // Images for power-ups
  char type;

  // Constructor
  Powerup() {
    x = int(random(width));
    y = -100;
    diam = int(random(20, 100));
    speed = 5;

    // Load images
    healthImg = loadImage("New Piskel.png");
    ammoImg = loadImage("Ammo.png");
    turretImg = loadImage("Turret.png");
    missileAmmo = loadImage("MissileB.png");
    laserPow = loadImage("LaserPow.png");

    int rand = int(random(6)); 
    if (rand == 0) {
      type = 'h'; // Health
    } else if (rand == 1) {
      type = 'a'; // Ammo
    } else if (rand == 2) {
      type = 't'; // Turret Count
    } else if (rand == 3) {
      type = 'u'; // Health Upgrade
    } else if (rand == 4) {
      type = 'l'; // Laser upgrade
    } else if (rand == 5) {
      type = 'u'; // Missiles upgrade
    }
  }

  // Member Methods
  void display() {
    // Display the appropriate image based on the power-up type
    imageMode(CENTER);
    if (type == 'h' && healthImg != null) {
      image(healthImg, x, y);
    } else if (type == 'a' && ammoImg != null) {
      image(ammoImg, x, y);
    } else if (type == 't' && turretImg != null) {
      image(turretImg, x, y);
    } else if (type == 'u' && missileAmmo != null) {
      image(missileAmmo, x, y);
    } else if (type == 'l' && laserPow != null) {
      image(laserPow, x, y);
    }
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    return y > height + 60;
  }

  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    return d < 45;
  }
}
