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

void glyph(PShape c)
{
  beginShape();
  for (int vi = 0; vi < c.getVertexCount(); vi++)
  {
    if (c.getVertexCode(vi) != VERTEX)
    {
      endShape(CLOSE);
      beginShape();
    }
    PVector v = c.getVertex(vi);
    vertex(v.x, v.y);
  }
  endShape(CLOSE);
}

void draw()
{
  PFont font = createFont("Hiragino Mincho ProN", 40, true);

  PShape c[] = {
    font.getShape('さ', 0.05),
    font.getShape('ち', 0.05),
    font.getShape('き', 0.05)
  };
  
  for (int y = 25; y < height - 20; y += 40)
  {
    for (int x = 40; x < width - 20; x += 40)
    {
      pushMatrix();
      translate(x, y);
      rotate((int)random(4) * PI / 2);
      translate(-21, 14);
      glyph(c[(int)random(2)]);
      popMatrix();
    }
  }
}
