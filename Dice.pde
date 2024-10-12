
void setup() {
    size(300, 300);
    noLoop();  // Only draw once unless mouse is pressed
}

void draw() {
    background(200);  // Set a background color
    
    int total = 0;  // Variable to store the sum of all dice rolls
    
    // Nested loops to create a 3x3 grid of dice
    for (int i = 0; i < 3; i++) {  // 3 rows
        for (int j = 0; j < 3; j++) {  // 3 columns
            Die die = new Die(50 + j * 60, 50 + i * 60);  // Position dice in a grid
            die.show();  // Display each die
            total += die.value;  // Add the die's value to the total
        }
    }
    
    // Display the total roll on the screen
    fill(0);
    textSize(20);
    text("Total: " + total, 20, height - 20);
}

void mousePressed() {
    redraw();  // Redraw and re-roll dice when mouse is clicked
}

// Die class to model a single dice cube
class Die {
    int x, y;  // Position of the die
    int value;  // Current value of the die (1 to 6)

    // Constructor
    Die(int x, int y) {
        this.x = x;
        this.y = y;
        roll();  // Roll the die upon creation
    }
    
    // Method to roll the die and set a random value
    void roll() {
        value = (int)(Math.random() * 6) + 1;  // Random value between 1 and 6
    }
    
    // Method to display the die
    void show() {
        fill(255);  // White dice
        rect(x, y, 50, 50);  // Draw the die as a square
        drawDots();  // Draw the dots based on the value of the die
    }

    // Method to draw the dots on the die
    void drawDots() {
        fill(0);  // Black dots
        float midX = x + 25;
        float midY = y + 25;

        // Draw dots based on the current value of the die
        if (value == 1) {
            ellipse(midX, midY, 10, 10);  // One dot in the center
        } 
        else if (value == 2) {
            ellipse(x + 15, y + 15, 10, 10);  // Top-left
            ellipse(x + 35, y + 35, 10, 10);  // Bottom-right
        } 
        else if (value == 3) {
            ellipse(x + 15, y + 15, 10, 10);  // Top-left
            ellipse(midX, midY, 10, 10);  // Center
            ellipse(x + 35, y + 35, 10, 10);  // Bottom-right
        } 
        else if (value == 4) {
            ellipse(x + 15, y + 15, 10, 10);  // Top-left
            ellipse(x + 35, y + 15, 10, 10);  // Top-right
            ellipse(x + 15, y + 35, 10, 10);  // Bottom-left
            ellipse(x + 35, y + 35, 10, 10);  // Bottom-right
        } 
        else if (value == 5) {
            ellipse(x + 15, y + 15, 10, 10);  // Top-left
            ellipse(x + 35, y + 15, 10, 10);  // Top-right
            ellipse(midX, midY, 10, 10);  // Center
            ellipse(x + 15, y + 35, 10, 10);  // Bottom-left
            ellipse(x + 35, y + 35, 10, 10);  // Bottom-right
        } 
        else if (value == 6) {
            ellipse(x + 15, y + 15, 10, 10);  // Top-left
            ellipse(x + 35, y + 15, 10, 10);  // Top-right
            ellipse(x + 15, midY, 10, 10);  // Middle-left
            ellipse(x + 35, midY, 10, 10);  // Middle-right
            ellipse(x + 15, y + 35, 10, 10);  // Bottom-left
            ellipse(x + 35, y + 35, 10, 10);  // Bottom-right
        }
    }
}
