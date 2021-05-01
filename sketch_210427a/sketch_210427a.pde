import processing.svg.*;

void setup()
{
  size(480, 300);

  randomSeed(0);
  noiseSeed(0);

  beginRecord(SVG, "plot.svg");

  noFill();
  noLoop();
}

void draw()
{  
  int reso = 200;
    
  for (int i = 0; i < reso; i++)
  {
    float phi = PI * 2 * i / reso;
    
    float l1 = height * 0.05;
    float l2 = l1 + width * random(0, 1);
    
    float x0 = cos(phi) * l1;
    float y0 = sin(phi) * l1;
    
    float x1 = cos(phi) * l2;
    float y1 = sin(phi) * l2;
    
    line(width / 2 + x0, height / 2 + y0, width / 2 + x1, height / 2 + y1);
  }
  
  endRecord();
}
