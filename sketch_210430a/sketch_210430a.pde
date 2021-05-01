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
  int div = 200;
  for (int i = 0; i < div; i++)
  {
    float x = (float)i / div;
    float x1 = x + noise(x * 4 + 24.27) * 0.2;
    float x2 = x + noise(x * 4 + 12.38) * 0.2;
    x1 = x1 * 1.2 - 0.2;
    x2 = x2 * 1.2 - 0.2;
    line(x1 * width, 0, x2 * width, height);
  }
}
