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
  PFont font = createFont("Hiragino Mincho ProN", 150, true);
  PShape shape = font.getShape('あ', 0.03);

  translate(width / 2, height / 2);
  
  beginShape();
  
  for (int vi = 0; vi < shape.getVertexCount(); vi++)
  {
    if (shape.getVertexCode(vi) != VERTEX)
    {
      endShape(CLOSE);
      beginShape();
    }
    PVector v = shape.getVertex(vi);
    v.add(-75, 50);
    vertex(v.x, v.y);
    if ((vi & 3) == 0)
    {
      PVector v2 = v.copy();
      v2.normalize();
      v2.mult(random(50, 300));
      vertex(v2.x, v2.y);
//      vertex(v.x, v.y);
    }
  }

  endShape(CLOSE);
}
