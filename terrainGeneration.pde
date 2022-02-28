
int density = 100;
int w = 2000;
int h = 2000;

float z = 0;

float s = 0.1;

float[][] terrain = new float[density][density+1];

void setup(){
  size(1000,1000, P3D);
  background(100);
  fillTerrain();
}

void draw(){
  noFill();
  background(100);
  translate(-width/2,0, -width/2);
  z-=0.3;
  rotateX(PI/4);
  translate(0,-width/8,0);
  for(int i=0;i<density-1;i++){
    beginShape(TRIANGLE_STRIP);
    for(int j=0;j<density+1;j++){
      vertex(j*w/density,i*h/density,noise((i+z)/10.0,j/10.0)*300);
      vertex(j*w/density,i*h/density+h/density,noise((i+1+z)/10.0,j/10.0)*300);
    }
    endShape();
  }
}

void fillTerrain(){
  for(int i=0;i<density;i++){
    for(int j=0;j<density+1;j++){
      terrain[i][j] = random(-100,100);
    }
  }
}
