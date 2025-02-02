

int numDice = 9; // Number of dice
Dice[] diceArray = new Dice[numDice];
int total = 0; // Variable to keep track of the total

void setup() {
  size(640, 640);
  textAlign(CENTER, CENTER);
  textSize(32);
  
  // Initialize the dice objects
  for (int i = 0; i < numDice; i++) {
    float x = (i % 3) * 200 + 100;
    float y = floor(i / 3) * 200 + 100;
    diceArray[i] = new Dice(x, y);
  }
}

void draw() {
  background(400);
  
  // Display all dice
  for (int i = 0; i < numDice; i++) {
    diceArray[i].display();
  }
  
  // Display the total
  fill(255);
  text("Total: " + total, width / 2, height - 50);
}

void mousePressed() {
  // Roll all dice when the mouse is clicked and update the total
  total = 0;
  for (int i = 0; i < numDice; i++) {
    diceArray[i].roll();
    total += diceArray[i].getCurrentFace();
  }
}

class Dice {
  float x, y;
  int numFaces = 6;
  int currentFace;

  Dice(float x, float y) {
    this.x = x;
    this.y = y;
    this.currentFace = 1;
  }

  void display() {
    // Draw the outline of the dice
    rectMode(CENTER);
    fill(255);
    rect(x, y, 100, 100, 10);
    
    // Draw dots on the dice based on the face value
    fill(0);
    int offsetX = 30;
    int offsetY = 30;
    int spacing = 20;
    switch (currentFace) {
      case 1:
        ellipse(x, y, 20, 20);
        break;
      case 2:
        ellipse(x - offsetX, y - offsetY, 20, 20);
        ellipse(x + offsetX, y + offsetY, 20, 20);
        break;
      case 3:
        ellipse(x - offsetX, y - offsetY, 20, 20);
        ellipse(x, y, 20, 20);
        ellipse(x + offsetX, y + offsetY, 20, 20);
        break;
      case 4:
        ellipse(x - offsetX, y - offsetY, 20, 20);
        ellipse(x + offsetX, y - offsetY, 20, 20);
        ellipse(x - offsetX, y + offsetY, 20, 20);
        ellipse(x + offsetX, y + offsetY, 20, 20);
        break;
      case 5:
        ellipse(x - offsetX, y - offsetY, 20, 20);
        ellipse(x + offsetX, y - offsetY, 20, 20);
        ellipse(x, y, 20, 20);
        ellipse(x - offsetX, y + offsetY, 20, 20);
        ellipse(x + offsetX, y + offsetY, 20, 20);
        break;
      case 6:
        ellipse(x - offsetX, y - offsetY, 20, 20);
        ellipse(x + offsetX, y - offsetY, 20, 20);
        ellipse(x - offsetX, y, 20, 20);
        ellipse(x + offsetX, y, 20, 20);
        ellipse(x - offsetX, y + offsetY, 20, 20);
        ellipse(x + offsetX, y + offsetY, 20, 20);
        break;
    }
  }

  void roll() {
    // Simulate rolling the dice by changing the face value
    currentFace = (int) random(1, numFaces + 1);
  }

  int getCurrentFace() {
    return currentFace;
  }
}
