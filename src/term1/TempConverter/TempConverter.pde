//Kai Hale | Temp Converter | 23 Sept 2024

void setup() {
  size(800, 400);
  background(128);
}

void draw () {
  background(128);
  textSize(30);
  text("Celsius to Fahrenheit Converter by Kai Hale", width/2, 50);
  textSize(12);
  line(0, height/2, width, height/2);

  //Tic Marks
  for (int i=0; i<=width; i+=20) {
    strokeWeight(2);
    line(i, 195, i, 205);
    textAlign(CENTER);
    text(i-400, i, 192);
  }
  fill(#152238);
  textSize(25);
  text("Celsius: " + farToCel(mouseX-368), width/2, 140);
  //println("MouseX:" + mouseX + " : " + farToCel(mouseX));
  text("Fahrenheit: " + celToFar(mouseX-400), width/2, 260);
  //println("MouseX:" + mouseX + " : " + celToFar(mouseX));
}

float farToCel(float tempFar) {
  //Formula to calculate celsius converter
  tempFar=(tempFar-32)*(5.0/9.0);
  return tempFar;
}

float celToFar(float tempCel) {
  //Formula to calculate backwards
  tempCel=(tempCel*9.0/5.0)+32;
  return tempCel;
}
