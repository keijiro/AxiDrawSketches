import processing.svg.*;

void setup()
{
  size(480, 300);

  randomSeed(1);
  noiseSeed(2);
  noiseDetail(5);

  beginRecord(SVG, "plot.svg");

  noFill();
  noLoop();
}

void draw()
{
  translate(width * 0.7, height / 1);
  rotate(45);
  translate(-width, -height);

  for (int y = 0; y < height * 2; y += 6)
  {
    for (int x = 0; x < width * 2;)
    {
      int x2 = x + (int)lerp(5, 50, pow(random(1), 2));
      line(x, y, x2, y);
      x = x2 + 5;
    }
  }
}
