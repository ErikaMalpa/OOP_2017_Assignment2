class Enemy extends Skeleton
{
  float x, y, r, midX, midY;
  
  Enemy(float xx, float yy, float rr)
  {
    x = xx;
    y = yy;
    r = rr;
    
    midX = width/2;
    midY = height/2;
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