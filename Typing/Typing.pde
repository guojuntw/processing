import java.awt.event.KeyEvent;

KeyBoard keyboard = new KeyBoard();

void setup() {
  size(1200, 600);  // Size must be the first statement
  stroke(255);     // Set line drawing color to white
  frameRate(30);
}


void draw() { 
  background(255);   // Set the background to black
  keyboard.draw();
} 

void keyPressed(KeyEvent event) {
  Key button =  keyboard.getKey(event.getKeyCode());
  if (button != null) {
    println("KeyEvent:" + event );  
    button.press();
  }
}

void keyReleased(KeyEvent event) {
  Key button =  keyboard.getKey(event.getKeyCode());
  if (button != null) {
    println(event);  
    button.release();
  }
}






