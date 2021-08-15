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
  PImage img = loadImage("MonaLisa.jpg");
  
  for (int x = 10; x < width - 10; x += 5)
  {
    beginShape();
    
    float phi = x;
    float gs = 0;

    for (int y = 10; y < height - 10; y += 1)
    {
      float gs2 = brightness(img.get(x, y)) / 255;
      
      gs2 = max(0, 1 - gs2);
      gs = lerp(gs, gs2, 0.1);

      phi += gs * gs;
      
      float d = (noise(phi) - 0.5) * 30 * gs;
      
      vertex(x + d, y);
    }
    
    endShape();
  }
}
