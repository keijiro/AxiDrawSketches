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

void glyph(int x0)
{
  int size = 10;
  int size2 = random(1) < 0.7 ? 5 : 10;
  int segs = (int)random(4, 8);
  for (int i = 0; i < segs; i++)
  {
    int x = ((int)random(2) - 1) * size + x0;
    int y = ((int)random(3)) * -size2;
    curveVertex(x, y);
  }
}

void draw()
{
  for (int y = 40; y < height - 20; y += 45)
  {
    pushMatrix();
    translate(0, y);
    beginShape();
    for (int x = 50; x < width - 50; x += 14)
    {
      glyph(x);
    }
    endShape();
    popMatrix();
  }
}
