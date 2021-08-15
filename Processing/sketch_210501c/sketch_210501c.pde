import processing.svg.*;

void setup()
{
  size(480, 300);

  randomSeed(0);
  noiseSeed(2);
  noiseDetail(5);

  beginRecord(SVG, "plot.svg");

  noFill();
  noLoop();
}

void glyph()
{
  int size = 10;
  int segs = (int)random(5, 10);
  beginShape();
  for (int i = 0; i < segs; i++)
  {
    int x = ((int)random(2) - 1) * size;
    int y = ((int)random(3) - 1) * size;
    if (i == 0) curveVertex(x - size, y - size);
    curveVertex(x, y);
    if (i == segs - 1) curveVertex(x + size, y + size);
  }
  endShape();
}

void draw()
{
  for (int y = 30; y < height - 30; y += 45)
  {
    for (int x = 50; x < width - 50; x += 18)
    {
      pushMatrix();
      translate(x, y);
      glyph();
      popMatrix();
    }
  }
}
