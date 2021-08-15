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
  translate(width / 2, height / 2);
  scale(height / 2.2, height / 2.2);
  strokeWeight(0.01);
  

  int div = 270;
  for (int i = 0; i < div; i++)
  {
    float theta = PI * 2 / div * i;
    float vx = cos(theta);
    float vy = sin(theta);
    float l = 1 - pow(noise(theta * 2), 8) * 4 - 0.05;

    line(vx * l, vy * l, vx, vy);
  }
}
