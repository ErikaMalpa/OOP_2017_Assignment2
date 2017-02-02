class Enemy extends Skeleton
{
  float x, y, r;
  
  Enemy(float xx, float yy, float rr)
  {
    x = xx;
    y = yy;
    r = rr;
  }
  
  void update()
  {
    
  }
  
  void display()
  {
    pushMatrix();
    fill(#F5E2B9);
    ellipse(x, y, r,r);
    popMatrix();
  }
}