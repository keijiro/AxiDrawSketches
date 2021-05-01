import processing.svg.*;

void setup()
{
  size(480, 300);
  noLoop();
  beginRecord(SVG, "test.svg");
}

void set_vertex(float x, float y)
{
  vertex(x * height * 0.2 + 0.5 * width, (y * 0.2 + 0.5) * height);
}

void draw()
{
  randomSeed(0);
  noiseSeed(100);
  
  noFill();
  
  float freq = 0.75;
  float speed = 0.05;
  
  for (int i = 0; i < 200; i++)
  {
    float phi = PI * 2 / 200 * i;

    float x = cos(phi) * 0.4;
    float y = sin(phi) * 0.4;

    beginShape();
    set_vertex(x, y);
    
    int itr = (int)random(20, 100);
    for (int j = 0; j < itr; j++)
    {
      float rate = 1.2 * j / itr;
      float phi2 = (noise(x * freq, y * freq) - 0.5) * PI * 4 * rate + phi + PI / 2;
      
      x += cos(phi2) * speed;
      y += sin(phi2) * speed;
      
      set_vertex(x, y);
    }
    
    endShape();
  }
   
  
  endRecord();
}
