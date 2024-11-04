//Kai Hale | Calculator | October 9, 2024

Button[] buttons = new Button[22];
String dVal = "0";
float l, r, result;
char op;
boolean left;

void setup() {
  size(300, 500);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  buttons[0] = new Button(80, 455, "0", 'r', true);
  buttons[1] = new Button(185, 455, ".", 'd', false);
  buttons[2] = new Button(255, 455, "=", 'c', false);
  buttons[3] = new Button(45, 385, "1", 'd', true);
  buttons[4] = new Button(115, 385, "2", 'd', true);
  buttons[5] = new Button(185, 385, "3", 'd', true);
  buttons[6] = new Button(255, 385, "+", 'c', false);
  buttons[7] = new Button(45, 315, "4", 'd', true);
  buttons[8] = new Button(115, 315, "5", 'd', true);
  buttons[9] = new Button(185, 315, "6", 'd', true);
  buttons[10] = new Button(255, 315, "−", 'c', false);
  buttons[11] = new Button(45, 245, "7", 'd', true);
  buttons[12] = new Button(115, 245, "8", 'd', true);
  buttons[13] = new Button(185, 245, "9", 'd', true);
  buttons[14] = new Button(255, 245, "x", 'c', false);
  buttons[15] = new Button(80, 175, "00", 'r', true);
  buttons[16] = new Button(185, 175, "±", 'd', false);
  buttons[17] = new Button(255, 175, "÷", 'c', false);
  buttons[18] = new Button(45, 105, "R", 'c', false);
  buttons[19] = new Button(115, 105, "x²", 'c', false);
  buttons[20] = new Button(185, 105, "π", 'c', false);
  buttons[21] = new Button(255, 105, "C", 'c', false);
}

void draw() {

  background(#383839);
  //println("Left:" + l + " Right:" + r + " Result:" + result + " Op:" + op + " L:" + left );
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].hover(mouseX, mouseY);
    buttons[i].display();
  }
  updateDisplay();
}

void updateDisplay() {
  if (dVal.length()<13) {
    textSize(40);
  } else if (dVal.length() == 13) {
    textSize(37);
  } else if (dVal.length() == 14) {
    textSize(34);
  } else if (dVal.length() == 15) {
    textSize(32);
  } else if (dVal.length() == 16) {
    textSize(30);
  } else if (dVal.length() == 17) {
    textSize(28);
  } else if (dVal.length() == 18) {
    textSize(26);
  } else if (dVal.length() == 19) {
    textSize(25);
  } else if (dVal.length() == 20) {
    textSize(24);
  } else if (dVal.length() == 21) {
    textSize(22);
  }
  fill(200);
  rectMode(CENTER);
  rect(width / 2, 38, 270, 55);
  fill(0);
  textAlign(RIGHT);
  text(dVal, width - 40, 53);
}

void mouseReleased() {
  //println("Left:" + l + " Right:" + r + " Result:" + result + " Op:" + op + " L:" + left );

  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length() < 20) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
      } else {
        dVal += buttons[i].val;
      }
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
      } else {
        dVal += buttons[i].val;
      }
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && buttons[i].val.equals("C")) {
      dVal = "0";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      op = '+';
      left = false;
      dVal = "0";  // Reset dVal after operation, for the right-hand input
    } else if (buttons[i].on && buttons[i].val.equals("−")) {
      op = '-';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("x")) {
      op = 'X';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("÷")) {
      op = '÷';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      performCalc();
    } else if (buttons[i].on && buttons[i].val.equals("±")) {
      if (left) {
        l *= -1;
        dVal = str(l);
      } else {
        r *= -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("x²")) {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("π")) {
      if (left) {
        l = 3.14159265359;
        dVal = str(l);
      } else {
        r = 3.14159265359;
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("R")) {
      if (left) {
        l = random(1, 101);
        dVal = str(l);
      } else {
        r = random(1, 101);
        dVal = str(r);
      }
    }
  }
}




void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'X') {
    result = l * r;
  } else if (op == '÷') {
    if (r != 0) {
      result = l / r;
    } else {
      dVal = "Err";
    }
  }

  if (!dVal.equals("Err")) {
    dVal = str(result);
  }
}


void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else if (key == '+' || keyCode == 17) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 109 || keyCode == 45) {
    handleEvent("−", false);
  } else if (key == '*' || keyCode == 106) {
    handleEvent("x", false);
  } else if (key == '/' || keyCode == 111 || keyCode == 92) {
    handleEvent("÷", false);
  } else if (key == '.' || keyCode == 110 || keyCode == 46) {
    handleEvent(".", false);
  } else if (key == '=' || keyCode == 10 || keyCode == 61) {
    performCalc();
  }
}


void handleEvent (String keyVal, boolean isNum) {
  if (left && dVal.length() < 13 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length() < 12 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    left = false;
    dVal = "0";
    op = '+';
  } else if (keyVal.equals("−") && !isNum) {
    left = false;
    dVal = "0";
    op = '-';
  } else if (keyVal.equals("÷") && !isNum) {  
    left = false;
    dVal = "0";
    op = '÷'; 
  } else if (keyVal.equals("x") && !isNum) {
    left = false;
    dVal = "0";
    op = 'X';  
  }
}
