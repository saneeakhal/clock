float rotSeconds = 0;
float rotMinutes = 0;
float rotHours = 0;
int lastSecond = 0;
int lastMinute = 0;
int lastHour = 0;
int cx, cy;

float faceSize = 500;
float lengthSecondHand = 220;
float lengthMinuteHand = 200;
float lengthHourHand = 100;

color outlineCol = color(255);
color secondCol = color(0);
color fromCol = color(14, 20, 77);
color toCol = color(227, 92, 39);
float lerpSpeed = 0.05;

void setup() {
  size(800, 600, P2D); 
  strokeWeight(2);
  cx = width / 2;
  cy = height / 2;
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  
  if (s != lastSecond) {
    rotSeconds = ((float) s / 60) * TWO_PI;
    lastSecond = s;
  }
  
  if (m != lastMinute) {
    rotMinutes = ((float) m / 60) * TWO_PI; 
    lastMinute = m;
  }
  
  if (h != lastHour) {
    rotHours = ((float) h / 12) * TWO_PI;  
    println(h);
    lastHour = h;
  }
  
  fill(fromCol);
  stroke(outlineCol);
  ellipse(width/2, height/2, faceSize, faceSize);
  
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * lengthSecondHand;
    float y = cy + sin(angle) * lengthSecondHand;
    vertex(x, y);
  }
  endShape();

  pushMatrix();
  translate(width/2, height/2);
  rotate(rotSeconds);
  fill(secondCol);
  stroke(secondCol);
  line(0, 0, 0, -lengthSecondHand);
  ellipse(0, -lengthSecondHand, 10,10);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotMinutes);
  fill(0);
  stroke(outlineCol);
  line(0, 0, 0, -lengthMinuteHand);
  ellipse(0, -lengthMinuteHand, 10,10);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(rotHours);
  line(0, 0, 0, -lengthHourHand);
  ellipse(0, -lengthHourHand, 10,10);
  popMatrix();
  
  if (s > 0){
  colorMode(HSB, 0, 0, 100);
  fromCol = lerpColor(fromCol, toCol, lerpSpeed);
  }
  
  fill(fromCol);
  ellipse(width/2, height/2, 10, 10);
}

//references
//ColorLerp : https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week05/ColorLerp01/ColorLerp01.pde
//Clock : https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week05/Clock02/Clock02.pde
//Clockticks  : https://processing.org/examples/clock.html
