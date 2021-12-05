int size = 101;
int[][] grid = new int[size][size];
int s = size/10;
int f = s;
int sm = s/2;

void setup() {
  size(1000,1000);
  background(155,255,0);
}

void line(PVector v1, PVector v2) {
  line(v1.x, v1.y, v2.x, v2.y);
}


void draw() {
  for (int i = 0; i < size; i++)  {
    for (int j = 0; j < size; j++)  {
      grid[i][j] = floor(random(2));
    }
  }
  background(155,255,0);
  
  for (int i = 0; i < size; i++)  {
    for (int j = 0; j < size; j++)  {
      stroke(grid[i][j] * 255);
      strokeWeight(1);
      point(i * s, j * s);
    }
  }
  
  

  
  for (int i = 0; i < size-1; i++)  {
    for (int j = 0; j < size-1; j++)  {
      strokeWeight(1);
      stroke(0,0,255);
      float x = i*s;
      float y = j*s;
      PVector a = new PVector(x + sm, y);
      PVector b = new PVector(x + f, y + sm);
      PVector c = new PVector(x + sm, y + f);
      PVector d = new PVector(x, y + sm);
     int state = getState(ceil(grid[i][j]), ceil(grid[i+1][j]), ceil(grid[i+1][j+1]), ceil(grid[i][j+1])); 
    
    switch (state) {
      case 1:  
        line(c, d);
        break;
      case 2:  
        line(b, c);
        break;
      case 3:  
        line(b, d);
        break;
      case 4:  
        line(a, b);
        break;
      case 5:  
        line(a, d);
        line(b, c);
        break;
      case 6:  
        line(a, c);
        break;
      case 7:  
        line(a, d);
        break;
      case 8:  
        line(a, d);
        break;
      case 9:  
        line(a, c);
        break;
      case 10: 
        line(a, b);
        line(c, d);
        break;
      case 11: 
        line(a, b);
        break;
      case 12: 
        line(b, d);
        break;
      case 13: 
        line(b, c);
        break;
      case 14: 
        line(c, d);
        break;
      }
    }
  }
  delay(200);
}

int getState(int a, int b, int c, int d) {
  return a * 8 + b * 4  + c * 2 + d * 1;
}
