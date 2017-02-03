class Bullet
{
  float x, y, r;
  
  Bullet(float xx, float yy, float rr)
  {
    x = xx;
    y = yy;
    r = rr;
  }
  
  void display()
  {
    pushMatrix();
    fill(#003D64);
    ellipse(x,y,r,r);
    popMatrix();
  }
  
}