float [] x;
float [] y;
int numberOfBalls = 5;
float [] xdelta;
float [] ydelta;
int points = 0;
int numberOfBallsremaining = numberOfBalls;

void setup(){
 size(500,500); 
 frameRate(60);
  
  x = new float[numberOfBalls];
  y = new float[numberOfBalls];
  xdelta = new float[numberOfBalls];
  ydelta = new float[numberOfBalls];
 
 for(int i = 0;i < numberOfBalls;i++){
   x[i] = random(10, 450);
   y[i] = random(10, 450);
   xdelta[i] = random(-3, 3);
   ydelta[i] = random(-3, 3);
 }
 
}

void draw(){

  println(random(0, 500));
   background(0);
    fill(255);
  stroke(0,255,0);
  strokeWeight(5);
  for(int i = 0;i<numberOfBalls;i++){
     ellipse (x[i], y[i], 20, 20);
     x[i] += xdelta[i];
     y[i] += ydelta[i];
     
     if((x[i] > width - 10) || (x[i]  < 10)){
       xdelta[i] = -xdelta[i];
     }
     if((y[i] > height - 10) || (y[i]  < 10)){
       ydelta[i] = -ydelta[i]; 
     }
  }
  textSize(32);
  fill(0, 50, 255);
  text("Points: " + points, 10, 40);
  if(numberOfBallsremaining == 0){
      textSize(64);
  fill(255, 0, 0);
  text("GAME OVER", 60, 250);
  }
}
void mousePressed() {
    for(int i = numberOfBalls-1;i>=0;i--){
  float dist = sqrt((x[i] - mouseX) * (x[i] - mouseX) + (y[i] - mouseY) * (y[i] - mouseY));
  if(dist <= 15){
    x[i] = - 100;
    y[i] = -100;
    int speedBonus = abs((int)xdelta[i]) + abs((int)xdelta[i]);
    int timeBonus = (int)(20000.0/millis()) * 20;
    points = points + 10 +  + timeBonus;
    numberOfBallsremaining--;
    return;
    }
  }
 //fill(random(0, 255), random(0, 255), random(0, 255));
 //ellipse(mouseX, mouseY, 20, 20);
}
