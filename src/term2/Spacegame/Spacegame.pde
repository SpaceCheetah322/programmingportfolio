// Kai Hale | Oct 31st | Spacegame
import processing.sound.*;
SoundFile laser, WinXpS, Explosion, Col;

Spaceship s1;
Rock r1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Missile> missiles = new ArrayList<Missile>();
ArrayList<Explosion> explosions = new ArrayList<Explosion>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
int score, level, rockRate, powRate;
boolean play;
Timer rTime, puTime;

void setup() {
  size(1920, 945);
  s1 = new Spaceship();
  score = 0;
  level = 1;
  play = false;
  rockRate = 500;
  rTime = new Timer(rockRate); // Adjust difficulty later
  rTime.start();
  powRate = 5000;
  puTime = new Timer(powRate); // Adjust difficulty later
  puTime.start();
  Col = new SoundFile (this, "Col.wav");
  WinXpS = new SoundFile(this, "WinXpS.wav");
  laser = new SoundFile(this, "laser.wav");
  Explosion = new SoundFile (this, "Explosion.wav");
  background(0);
  frameRate(50);
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);
    if (frameCount % 1000 == 0) {
      level ++;
      rockRate -= 100;
      rTime.totalTime -=50;
      powRate += 25;
    }


    // Manage stars
    stars.add(new Star());
    for (int i = stars.size() - 1; i >= 0; i--) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) stars.remove(i);
    }

    // Manage power-ups
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = powups.size() - 1; i >= 0; i--) {
      Powerup pu = powups.get(i);
      pu.move();
      pu.display();
      if (pu.intersect(s1)) handlePowerup(pu);
      else if (pu.reachedBottom()) powups.remove(i);
    }

    // Manage lasers
    handleLasers();

    // Manage missiles
    handleMissiles();

    // Manage explosions
    handleExplosions();

    // Manage rocks
    if (rTime.isFinished()) spawnRock();
    handleRocks();

    // Display ship and game info
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health < 1) gameOver();
  }
}

void handlePowerup(Powerup pu) {
  switch (pu.type) {
  case 'h':
    s1.health += 20;
    break;
  case 'a':
    s1.laserCount += 100;
    break;
  case 't':
    s1.turretCount += 1;
    break;
  case 'u':
    s1.missileCount += 5;
    break;
  case 'l':
    s1.laserCount += 400;
    s1.upgradeLaser();
    break;
  }
  powups.remove(pu);
}

void handleLasers() {
  for (int i = lasers.size() - 1; i >= 0; i--) {
    Laser laser = lasers.get(i);
    for (int j = rocks.size() - 1; j >= 0; j--) {
      Rock rock = rocks.get(j);
      if (laser.intersect(rock)) {
        rock.diam -= 20 * s1.laserDamage;  // Apply doubled damage if upgraded
        if (rock.diam < 1) rocks.remove(j);
        score += 100;
        lasers.remove(i);
        break;
      }
    }
    if (i < lasers.size()) {
      laser.display();
      laser.move();
      if (laser.reachedTop()) lasers.remove(i);
    }
  }
}


void handleMissiles() {
  for (int i = missiles.size() - 1; i >= 0; i--) {
    Missile missile = missiles.get(i);
    for (int j = rocks.size() - 1; j >= 0; j--) {
      Rock rock = rocks.get(j);
      if (missile.intersect(rock)) {
        rock.diam -= 100;
        if (rock.diam < 1) rocks.remove(j);
        score += 200;
        explosions.add(new Explosion(missile.x, missile.y));
        missiles.remove(i);
        break;
      }
    }
    missile.display();
    missile.move();
    if (missile.reachedTop()) {
      explosions.add(new Explosion(missile.x, missile.y));
      missiles.remove(i);
    }
  }
}

void handleExplosions() {
  for (int i = explosions.size() - 1; i >= 0; i--) {
    Explosion explosion = explosions.get(i);
    explosion.display();
    Explosion.play();
    if (explosion.isFinished()) explosions.remove(i);
  }
}

void spawnRock() {
  rocks.add(new Rock());
  rTime.start();
}

void handleRocks() {
  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = rocks.get(i);
    rock.display();
    rock.move();
    if (s1.intersect(rock)) {
      Col.play();
      score -= 10;
      s1.health -= 10;
      rocks.remove(i);
      i--; // Prevent skipping elements
    } else if (rock.reachedBottom()) {
      rocks.remove(i);
      i--; // Prevent skipping elements
    }
  }
}

void keyPressed() {
  if (key == ' ' && s1.fire()) {
    fireTurrets();
    laser.play();
  }
}

void fireTurrets() {
  float spacing = 20;
  float offset = (s1.turretCount - 1) * spacing / 2;
  for (int i = 0; i < s1.turretCount; i++) {
    int xPosition = (int)(s1.x - offset + i * spacing);
    lasers.add(new Laser(xPosition, s1.y, s1.getLaserImage())); // Pass the correct image
  }
  s1.laserCount -= s1.turretCount;
}


void mousePressed() {
  if (mouseButton == LEFT && s1.fire()) fireTurrets();
  laser.play();
  if (mouseButton == RIGHT && s1.fireMissile()) {
    missiles.add(new Missile(s1.x, s1.y));
    s1.missileCount--;
  }
}

void infoPanel() {
  textSize(30);
  rectMode(CENTER);
  textAlign(LEFT, BASELINE);
  fill(127, 127);
  noStroke();
  rect(width / 2, 20, width, 40);
  fill(200);
  text("Score: " + score, 20, 30);
  text("Health: " + s1.health, 200, 30);
  text("Ammo: " + s1.laserCount, 420, 30);
  text("Level: " + level, 1750, 30);
  text("Missiles: " + s1.missileCount, 650, 30);
}

void startScreen() {
  background(0);
  fill(255);
  textSize(50);
  textAlign (CENTER, CENTER);
  text("Welcome to SpaceGame", 960, 250);
  text("By: Kai Hale", 960, 330);
  text("Click to start", 960, 670);
  if (mousePressed) {
    play = true;
    WinXpS.play();
  }
}

void gameOver() {
  background(0);
  fill(255);
  textSize(50);
  textAlign (CENTER, CENTER);
  text("Womp Womp, Game Over", 960, 250);
  text("Score: " + score, 960, 330);
  text("Final Level Reached: " + level, 960, 670);
  noLoop();
}
