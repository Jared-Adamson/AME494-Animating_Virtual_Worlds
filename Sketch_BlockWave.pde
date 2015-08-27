void setup() {

size(100, 100);
}

void draw(){

background(128);

int x = 0;

int y = height / 2;
int xp = x;
int yp = y;

while ( x < width){
  y = int(sin(x/10) * 10) + 10;
  line(xp, yp, x, y);
  yp = y;
  xp = x;
  x += 1;
  }
}
