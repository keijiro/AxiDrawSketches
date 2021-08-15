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
  for (int i = 0; i < 60; i++)
  {
    beginShape();
    for (float x = 0; x < width; x += 2)
    {
      float y = (noise(x * 0.005, i * 0.04) - 0.5) * 2;
      y *= 200;
      float g = (x - width / 2) * 0.008;
      y *= exp(-g * g);
      vertex(x, y + i * height / 60 * 0.9 + 0.075 * height);
    }
    endShape();
  }
}
