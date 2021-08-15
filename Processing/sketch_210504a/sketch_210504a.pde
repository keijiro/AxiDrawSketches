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

void spiral(float r, boolean ln)
{
  float phi = (1 + sqrt(5)) / 2;
  
  float theta = HALF_PI;
  PVector p = new PVector(0, 0);
  PVector d = new PVector(0, -1);
  
  for (int i = 0; i < 11; i++)
  {
    PVector d1 = d.copy();
    d1.mult(r);
    
    d.rotate(-HALF_PI);

    PVector d2 = d.copy();
    d2.mult(r);
    
    PVector p1 = p.copy();
    p1.add(d1);
    
    PVector p2 = p1.copy();
    p2.sub(d2);

    PVector p3 = p.copy();
    p3.sub(d2);

    arc(p1.x, p1.y, r * 2, r * 2, theta - HALF_PI, theta);

    if (ln)
    {
      line(p.x, p.y, p1.x, p1.y);
      line(p1.x, p1.y, p2.x, p2.y);
      line(p.x, p.y, p3.x, p3.y);
      line(p2.x, p2.y, p3.x, p3.y);
      line(p.x, p.y, p2.x, p2.y);
    }

    p = p2;
    theta -= HALF_PI;
    r *= phi;
  }
}

void draw()
{
  translate(width * 0.7, height * 0.7);
  spiral(2, true);
  //spiral(1.99, false);
  spiral(1.995, false);
}
