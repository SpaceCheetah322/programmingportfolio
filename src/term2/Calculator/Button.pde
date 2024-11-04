class Button {
  int x, y, w, h;
  char shapeType;
  color c1, c2;
  String val;
  boolean on, isNum;

  Button(int x, int y, String val, char shapeType, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = (shapeType == 'r') ? 130 : 60;
    this.h = 60;
    this.shapeType = shapeType;
    c1 = color(#898989);
    c2 = color(#AAAAAA);
    this.val = val;
    on = false;
    this.isNum = isNum;
  }

  void display() {
    fill(on ? c2 : c1);
    rectMode(CENTER);

    if (shapeType == 'c') {
      ellipse(x, y, w, w);
    } else {
      rect(x, y, w, h, 4);
      textSize(28);
    }

    fill(0);
    textAlign(CENTER, CENTER);
    text(val, x, y);
    textSize(28);
  }

  boolean hover(int mx, int my) {
    if (shapeType == 'c') {
      float d = dist(mx, my, x, y);
      on = (d < w / 2);
    } else {
      on = (mx > x - w / 2 && mx < x + w / 2 && my > y - h / 2 && my < y + h / 2);
    }
    return on;
  }
}
