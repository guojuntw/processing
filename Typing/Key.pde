class Key {

  int TEXT_SIZE = 20;
  int DEFAULT_KEY_COLOR = 255;
  int DEFAULT_LABEL_COLOR = 0;
  int DEFAULT_STOKE_COLOR = 150;

  int keyColor = DEFAULT_KEY_COLOR;
  int lableColor = DEFAULT_LABEL_COLOR;

  boolean isPressed = false;
  String lable;
  int x;
  int y;
  int hight;
  int width;
  int keyCode;

  Key(String lable, int width, int hight, int keyCode) {
    this.lable = lable;

    this.width = width;
    this.hight = hight;
    this.keyCode = keyCode;
  }

  int getKeyCode() {
    return keyCode;
  }

  void setPosition(int x, int y) {
    this.x = x;
    this.y = y;
  }

  Point getPosition() {
    return new Point(x, y);
  }

  int getWidth() {
    return width;
  }

  int getHight() {
    return hight;
  }

  String getLable() {
    return lable;
  }

  void press() {
    isPressed = true;
  }

  void release() {
    isPressed = false;
  }

  void draw() {
    stroke(DEFAULT_STOKE_COLOR);

    // Draw reactangle
    fill(keyColor);
    rect(x, y, width, hight, 12);
    textSize(TEXT_SIZE);

    // Draw label
    fill(lableColor); 
    textAlign(CENTER);
    text(lable, x + width/2, y + hight/2 + TEXT_SIZE/2);
  }

  void drawPressUp() {
    keyColor = DEFAULT_KEY_COLOR; 
    lableColor = DEFAULT_LABEL_COLOR;
    draw();
  }

  void drawPressDown() {
    keyColor = DEFAULT_KEY_COLOR ^ 255; 
    lableColor = DEFAULT_LABEL_COLOR ^ 255;
    draw();
  }

  void show() {
    if (isPressed) {
      drawPressDown();
    } else {
      drawPressUp();
    }
  }
}

