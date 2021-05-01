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
  PImage img = loadImage("Portrait.jpg");
  
  sketch(img, +1, 180, 3);
  sketch(img, -1, 100, 4);
}

void sketch(PImage img, float dir, float threshold, float interval)
{
  for (float l = 390; l < 940; l += interval)
  {
    boolean down = false;
    
    for (float phi = PI * 1.1; phi < PI * 1.4; phi += 0.002)
    {
      float x = width  * 1.5 + cos(phi) * l;
      float y = height * 2.0 + sin(phi) * l + 0.1 * l;
      
      if (dir < 0) y = height - y;
      
      if (x < 0 || y < 0 || x > width - 1 || y > height - 1) continue;
      
      boolean black = brightness(img.get((int)x, (int)y)) < threshold + random(-20, 20);
      
      if (down)
      {
        if (!black)
        {
          vertex(x, y);
          endShape();
        }
      }
      else
      {
        if (black) beginShape();
      }
      
      down = black;

      if (down) vertex(x, y);
    }
    
    if (down) endShape();
  }
}
