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

void draw()
{
  int count = 40;
  for (int i = 0; i < count; i++)
    line(0, height * i / count, width, height * (count - 1 - i) / count);
}
