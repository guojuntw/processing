import java.util.Map;
import java.util.Properties;

class KeyBoard {
  //[label]:[width]:[hight]:[key code]
  String[][] commonKeyLabels = new String[][] {
    {
       "`:100:60:192","1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "Back Space:120:60:8"
    }
    , {
      "Tab:120:60:9", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "[", "]", "\\:100:60:92"
    }
    , {
      "Caps Lock:140:60:20", "A", "S", "D", "F", "G", "H", "J", "K", "L", ";", "':60:60:222", "Enter:150:60:10"
    }
    , {
      "Shift:160:60:16", "Z", "X", "C", "V", "B", "N", "M", ",", ".", "/", "Shift:130:60:999999", "↑:60:60:38"
    }
    , {
      "Ctrl:130:60:17", "Fn:60:60:77777", "Alt:90:60:88888", "Space:620:60:32", "←:60:60:37", "↓:60:60:40", "→:60:60:39"
    }
  };
  int DEFAULT_KEY_HIGHT = 60;
  int DEFAULT_KEY_WIDTH = 60;
  HashMap<Integer, Key> keys = new HashMap<Integer, Key>();


  KeyBoard() {
    int startX = 20;
    int yPos = 20;
    int spacing = 10;

    for (int i=0; i< commonKeyLabels.length; i++) {
     // startX += 20;
      int priviousKeyEndX = startX;

      for (int j = 0; j< commonKeyLabels[i].length; j++) {

        String keyPropertieStr  = commonKeyLabels[i][j];

        Key key = createKey(keyPropertieStr);

        key.setPosition(priviousKeyEndX += spacing, yPos);
        keys.put(key.getKeyCode(), key);
        priviousKeyEndX += key.getWidth();
      }
      yPos +=70;
    }
  }

  Key createKey(String propertiesStr) {

    String[] propertiesArray = propertiesStr.split(":");

    Key key = null;
    if (propertiesArray.length == 1) {
      key = new Key(propertiesArray[0], DEFAULT_KEY_WIDTH, DEFAULT_KEY_HIGHT, (int)propertiesArray[0].toUpperCase().charAt(0));
    } else {
      key = new Key(propertiesArray[0], Integer.parseInt(propertiesArray[1]), Integer.parseInt(propertiesArray[2]), Integer.parseInt(propertiesArray[3]));
    }
    return key;
  }

  Key getKey(int keyCode) {
    return keys.get(keyCode);
  }

  void draw() {
    for (Map.Entry entry : keys.entrySet ()) {
      ((Key)entry.getValue()).show();
    }
  }
}

