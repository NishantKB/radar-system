import processing.serial.*;
import java.awt.event.KeyEvent;
import java.io.IOException;

Serial myPort;
String angle = "";
String distance = "";
String data = "";
float pixsDistance;
int iAngle, iDistance;
int index1 = 0;
int index2 = 0;
PFont orcFont;


void setup() {
  size(1366, 700);
  smooth();
  myPort = new Serial(this, "COM10", 9600);
  myPort.bufferUntil('.');
   orcFont = createFont("Roboto-Medium.ttf", 16);
  textFont(orcFont);
}

void draw() {
  background(0,0,0); 
  
  drawRadar();
  drawLine();
  drawObject();
  drawText();
}

void serialEvent(Serial myPort) {
  data = myPort.readStringUntil('.');
  if (data != null) {
    data = data.trim(); 
    println("Raw data received: " + data); 
    
    if (data.length() < 5) {
      return;
    }
    
    index1 = data.indexOf(",");
    if (index1 >= 0) {
      angle = data.substring(0, index1).trim();
      distance = data.substring(index1 + 1).trim();
      iAngle = int(angle);
      iDistance = int(distance);
      
      println("Parsed angle: " + iAngle + ", Parsed distance: " + iDistance); // Debugging line
    }
  }
}


void drawRadar() {
  pushMatrix();
  translate(width / 2, height - height * 0.074);
  noFill();
  strokeWeight(2);
  stroke(98, 245, 31);
  float arcSpacing = width * 0.2075; 
  for (int i = 0; i < 4; i++) {
    arc(0, 0, arcSpacing * (i + 1), arcSpacing * (i + 1), PI, TWO_PI);
  }
  for (int angle = 30; angle <= 150; angle += 30) {
    float x = -width / 2 * cos(radians(angle));
    float y = -width / 2 * sin(radians(angle));
    line(0, 0, x, y);
  }
  popMatrix();
}

void drawObject() {
  if (iDistance < 40) {
    pushMatrix();
    translate(width / 2, height - height * 0.074);
    strokeWeight(9);
    stroke(255, 10, 10);
    
    println("Drawing object: Angle = " + iAngle + ", Distance = " + iDistance);

    pixsDistance = iDistance * ((height - height * 0.1666) * 0.025);
    
    // Draw the line from the center to the detected object
    float endX = pixsDistance * cos(radians(iAngle));
    float endY = -pixsDistance * sin(radians(iAngle));
    line(endX, endY, (width - width * 0.505) * cos(radians(iAngle)), -(width - width * 0.505) * sin(radians(iAngle)));
    popMatrix();
  }
}

void drawLine() {
  pushMatrix();
  translate(width / 2, height - height * 0.074);
  strokeWeight(9);
  stroke(30, 250, 60); // Green color
  line(0, 0, (height - height * 0.12) * cos(radians(iAngle)), -(height - height * 0.12) * sin(radians(iAngle)));
  popMatrix();
}

void drawText() {
  fill(0);
  noStroke();
  rect(0, height - height * 0.0648, width, height);

  fill(98, 245, 31);
  textSize(25);
  textAlign(LEFT);
  text("VSN Robotics", width * 0.02, height - height * 0.0277);
  text("Angle: " + iAngle + " °", width * 0.36, height - height * 0.0277);
  text("Distance: " + iDistance + " cm", width * 0.51, height - height * 0.0277);

  fill(98, 245, 60);
  textSize(18);
  textAlign(CENTER);
  String[] angleLabels = {"30°", "60°", "90°", "120°", "150°"};
  float radius = (width - width * 0.4994) / 2;
  for (int i = 0; i < angleLabels.length; i++) {
    float x = width / 2 + radius * cos(radians(i * 30 + 30));
    float y = (height - height * 0.0907) - radius * sin(radians(i * 30 + 30));
    text(angleLabels[i], x, y);
  }

  textSize(18);
  textAlign(RIGHT);
  text("10cm", width * 0.45, height - height * 0.0833);
  text("20cm", width * 0.55, height - height * 0.0833);
  text("30cm", width * 0.65, height - height * 0.0833);
  text("40cm", width * 0.75, height - height * 0.0833);
}
