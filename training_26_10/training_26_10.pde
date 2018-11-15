float [] x;
float [] y;
int numberOfBalls = 50;
float [] xdelta;
float [] ydelta;

void setup(){
 size(1920,1080); 
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
     
}
