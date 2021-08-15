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
  PShape shape = font.getShape('あ', 0.05);

  translate(0, height / 2 + 50);
  
  float deform = 0;
  float ns = 0.06;
  
  for (int i = 0; i < 18; i+=3)
  {
    beginShape();
    for (int vi = 0; vi < shape.getVertexCount(); vi++)
    {
      if (shape.getVertexCode(vi) != VERTEX)
      {
        endShape(CLOSE);
        beginShape();
      }
      PVector v = shape.getVertex(vi);
      vertex(v.x + (noise(v.x * ns, v.y * ns, i * 0.22 + 18.32) - 0.5) * deform,
             v.y + (noise(v.x * ns, v.y * ns, i * 0.22 + 31.34) - 0.5) * deform);
    }
    endShape(CLOSE);

        translate(20, 0);
    scale(1.01);
    deform += 3;
translate(20, 0);
    scale(1.01);
    deform += 3;
    
    translate(20, 0);
    scale(1.01);
    deform += 3;
  }
}
