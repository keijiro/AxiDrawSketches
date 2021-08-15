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
  int reso = 100;

  float d_phi = 0.6;
  float d_l = 20;
  
  for (int i = 0; i < reso; i++)
  {
    float phi = PI * 2 * i / reso;
    float l = 20;

    int rep = (int)random(2, 12);
    
    beginShape();
    
    for (int j = 0; j < rep; j++)
    {
      float x = cos(phi) * l + width / 2;
      float y = sin(phi) * l + height / 2;
      
      vertex(x, y);
      
      phi += d_phi;
      l += d_l;
    }

    endShape();
  }
  
  endRecord();
}
