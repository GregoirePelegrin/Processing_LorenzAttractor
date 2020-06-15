import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 8.0/3.0;

float t = 0;

float dt = 0.01;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam cam;


void setup(){
  size(800, 800, P3D);
  colorMode(HSB);
  translate(width/2, height/2);
  cam = new PeasyCam(this, 500);  
}

void draw(){
  background(0);
  float dx = a*(y-x);
  float dy = x*(b-z)-y;
  float dz = x*y-c*z;
  x += dx*dt;
  y += dy*dt;
  z += dz*dt;
  
  points.add(new PVector(x, y, z));
  //translate(width/2, height/2);
  noFill();
  scale(5);
  float hu = 0;
  beginShape();
  for(PVector v : points){
    stroke(hu, 255, 255);
    vertex(v.x, v.y, v.z);
    
    // Part to comment if you don't want the "vibrato"
    PVector offset = PVector.random3D();
    offset.mult(0.05);
    v.add(offset);
    // End of part
    
    hu += 0.1;
    if(hu>255){
      hu = 0;
    }
  }   
  endShape();
}
