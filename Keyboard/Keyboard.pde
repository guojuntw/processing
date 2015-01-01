import java.util.Map;


KeyBoard keyboard = new KeyBoard();


void setup() {
  size(1000, 360);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  //frameRate(30);
}


void draw() { 
  background(255);   // Set the background to black
  keyboard.draw();
} 

void keyPressed() {
  Key button =  keyboard.getKey(str(key).toUpperCase());
  if (button != null) {
    button.press();
  }
}

void keyReleased() {
  Key button =  keyboard.getKey(str(key).toUpperCase());
  if (button != null) {
    button.release();
  }
}

//----------------------------------------
class Key {
  boolean isPressed = false;
  String lable;
  int KEY_SIZE = 60;
  int TEXT_SIZE = 20;
  int DEFAULT_KEY_COLOR = 0;
  int DEFAULT_LABEL_COLOR = 255;
  int DEFAULT_STOKE_COLOR = 150;

  int keyColor = DEFAULT_KEY_COLOR;
  int lableColor = DEFAULT_LABEL_COLOR;


  int x;
  int y;

  public Key(String lable, int x, int y) {
    this.lable = lable;
    this.x = x;
    this.y = y;
  }

  Point getPosition() {
    return new Point(x, y);
  }

  public String getLable() {
    return lable;
  }

  public void press() {
    isPressed = true;
  }

  public void release() {
    isPressed = false;
  }

  private void draw() {
    stroke(DEFAULT_STOKE_COLOR);

    // Draw reactangle
    fill(keyColor);
    rect(x, y, KEY_SIZE, KEY_SIZE, 12);
    textSize(TEXT_SIZE);

    // Draw label
    fill(lableColor); 
    textAlign(CENTER);
    text(lable, x + KEY_SIZE/2, y + KEY_SIZE/2 + TEXT_SIZE/2);
  }

  private void drawPressUp() {
    keyColor = DEFAULT_KEY_COLOR; 
    lableColor = DEFAULT_LABEL_COLOR;
    draw();
  }

  private void drawPressDown() {
    keyColor = DEFAULT_KEY_COLOR ^ 255; 
    lableColor = DEFAULT_LABEL_COLOR ^ 255;
    draw();
  }

  public void show() {
    if (isPressed) {
      drawPressDown();
    } else {
      drawPressUp();
    }
  }
}

class KeyBoard {
  String[][] commonKeyLabels = new String[][] {
    {
      "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "<-"
    }
    , {
      "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "[", "]", "\\"
    }
    , {
      "A", "S", "D", "F", "G", "H", "J", "K", "L", ";", "'"
    }
    , {
      "Z", "X", "C", "V", "B", "N", "M", ",", ".", "/"
    }
  };

  HashMap<String, Key> keys = new HashMap<String, Key>();

  public KeyBoard() {
    int xPos = 20;
    int yPos = 20;
    for (int i=0; i< commonKeyLabels.length; i++) {

      for (int j = 1; j< commonKeyLabels[i].length; j++) {
        String keyLabel  = commonKeyLabels[i][j];
        Key kb = new Key(keyLabel, xPos += 70, yPos );
        keys.put(kb.getLable(), kb);
      }
      yPos +=70;
      xPos = (i+2)*20 ;
    }
  }

  public Key getKey(String key) {
    return keys.get(key);
  }

  public void draw() {
    for (Map.Entry entry : keys.entrySet ()) {
      ((Key)entry.getValue()).show();
    }
  }
}


