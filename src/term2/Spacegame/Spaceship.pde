class Spaceship {
  // Member variables
  int x, y, w, laserCount, turretCount, health, missileCount, laserDamage;  // Added laserDamage
  boolean laserUpgraded;  // Track if the laser has been upgraded
  PImage ship, upgradedLaserImg, regularLaserImg;  // Images for the ship, upgraded laser, and regular laser

  // Constructor
  Spaceship() {
    x = width / 2;
    y = height / 2;
    w = 100;
    missileCount = 10; // Initialize missileCount
    laserCount = 1000;
    turretCount = 1;
    health = 100;
    laserDamage = 1;  // Default laser damage
    laserUpgraded = false;  // Initially, the laser is not upgraded
    ship = loadImage("SpaceShipA.gif");
    ship.resize(w, 0);

    // Load images
    upgradedLaserImg = loadImage("LaserPowUpgrade.png");
    regularLaserImg = loadImage("Projectile.png");
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    image(ship, x, y, w, ship.height * w / ship.width); // Scale width and height
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire() {
    return laserCount >= turretCount; // Ensure enough ammo for all turrets
  }

  boolean fireMissile() {
    return missileCount > 0; // Ensure there are missiles available to fire
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    return d < 50;
  }

  // Method to upgrade laser when power-up is collected
  void upgradeLaser() {
    laserDamage = 2;  // Double the laser damage
    laserUpgraded = true;  // Mark laser as upgraded
  }

  // Get the current laser image depending on whether it is upgraded
  PImage getLaserImage() {
    return laserUpgraded ? upgradedLaserImg : regularLaserImg;
  }
}
